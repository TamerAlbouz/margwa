import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/api_requests/api_calls.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/backend.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

import 'package:background_fetch/background_fetch.dart';

// [Android-only] This "Headless Task" is run when the Android app is terminated with `enableHeadless: true`
// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  ApiCallResponse? apiResult;
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    // This task has exceeded its allowed running-time.
    // You must stop what you're doing and immediately .finish(taskId)
    print("[BackgroundFetch] Headless task timed-out: $taskId");
    BackgroundFetch.finish(taskId);
    return;
  }
  print('[BackgroundFetch] Headless event received.');

  queryFavoritesRecord(
    queryBuilder: (favoritesRecord) =>
        favoritesRecord.where('user', isEqualTo: currentUserReference),
  ).listen(
    (favoritesRecordList) async {
      // Check for each element in the list, if total from getChapters(Id) API response matches num_chapters from favoritesRecord
      for (var i = 0; i < favoritesRecordList.length; i++) {
        final favoritesRecord = favoritesRecordList[i];
        // Get total from getChapters(Id) API response
        apiResult = await GetChaptersCall.call(
          id: favoritesRecord.id,
        );

        // Compare total from getChapters(Id) API response to num_chapters from favoritesRecord
        if (getJsonField(
              (apiResult?.jsonBody ?? ''),
              r'''$.total''',
            ) !=
            favoritesRecord.numChapters) {
          // If they don't match, send notification
          favoritesRecord.reference.update(createFavoritesRecordData(
              numChapters: getJsonField(
            (apiResult?.jsonBody ?? ''),
            r'''$.total''',
          )));
          triggerPushNotification(
            notificationTitle: favoritesRecord.title,
            notificationText: 'Updated with ${(getJsonField(
                  (apiResult?.jsonBody ?? ''),
                  r'''$.total''',
                ) - favoritesRecord.numChapters).toString()} new chapters!',
            notificationSound: 'default',
            userRefs: [favoritesRecord.user!],
            initialPageName: 'Manga',
            parameterData: {
              'title': favoritesRecord.title,
              'desc': favoritesRecord.desc,
              'src': favoritesRecord.src,
              'id': favoritesRecord.id,
            },
          );
        }
      }
    },
  );
  BackgroundFetch.finish(taskId);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  await FlutterFlowTheme.initialize();

  runApp(MyApp());

  await BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
    userStream = margwaFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    ApiCallResponse? apiResult;
    // Configure BackgroundFetch.
    int status = await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 15,
            stopOnTerminate: false,
            enableHeadless: true,
            startOnBoot: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.NONE), (String taskId) async {
      // <-- Event handler
      // This is the fetch-event callback.
      print("[BackgroundFetch] Event received $taskId");

      queryFavoritesRecord(
        queryBuilder: (favoritesRecord) =>
            favoritesRecord.where('user', isEqualTo: currentUserReference),
      ).listen(
        (favoritesRecordList) async {
          // Check for each element in the list, if total from getChapters(Id) API response matches num_chapters from favoritesRecord
          for (var i = 0; i < favoritesRecordList.length; i++) {
            final favoritesRecord = favoritesRecordList[i];
            // Get total from getChapters(Id) API response
            apiResult = await GetChaptersCall.call(
              id: favoritesRecord.id,
            );

            // Compare total from getChapters(Id) API response to num_chapters from favoritesRecord
            if (getJsonField(
                  (apiResult?.jsonBody ?? ''),
                  r'''$.total''',
                ) !=
                favoritesRecord.numChapters) {
              // If they don't match, send notification
              favoritesRecord.reference.update(createFavoritesRecordData(
                  numChapters: getJsonField(
                (apiResult?.jsonBody ?? ''),
                r'''$.total''',
              )));
              triggerPushNotification(
                notificationTitle: favoritesRecord.title,
                notificationText: 'Updated with ${(getJsonField(
                      (apiResult?.jsonBody ?? ''),
                      r'''$.total''',
                    ) - favoritesRecord.numChapters!).toString()} new chapters!',
                notificationSound: 'default',
                userRefs: [currentUserReference!],
                initialPageName: 'Manga',
                parameterData: {
                  'title': favoritesRecord.title,
                  'desc': favoritesRecord.desc,
                  'src': favoritesRecord.src,
                  'id': favoritesRecord.id,
                },
              );
            }
          }
        },
      );
      // IMPORTANT:  You must signal completion of your task or the OS can punish your app
      // for taking too long in the background.
      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      // <-- Task timeout handler.
      // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
      print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
      BackgroundFetch.finish(taskId);
    });
    print('[BackgroundFetch] configure success: $status');

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Margwa',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
