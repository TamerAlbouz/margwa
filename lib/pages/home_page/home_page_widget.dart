import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          if (pageViewCurrentIndex < 9) {
            await _model.pageViewController?.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          } else {
            await _model.pageViewController?.animateToPage(
              0,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Margwa_Bigger.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.settings,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('Settings');
                  },
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('SearchPage');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.search,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Search...',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Nunito',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primaryBackground,
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).primaryBackground
                          ],
                          stops: [0.0, 0.35, 0.5],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 4.0),
                                      child: Text(
                                        'Latest',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Nunito',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 12.0, 8.0, 12.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: GetMangaCall.call(
                                      limit: 10,
                                      offset: 0,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 75.0,
                                            height: 75.0,
                                            child: SpinKitRipple(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 75.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final pageViewGetMangaResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final manga = (GetMangaCall.data(
                                                    pageViewGetMangaResponse
                                                        .jsonBody,
                                                  )
                                                      ?.map((e) => e)
                                                      .toList()
                                                      ?.toList() ??
                                                  [])
                                              .take(10)
                                              .toList();
                                          if (manga.isEmpty) {
                                            return EmptyWidget();
                                          }
                                          return Container(
                                            width: double.infinity,
                                            height: 500.0,
                                            child: PageView.builder(
                                              controller: _model
                                                      .pageViewController ??=
                                                  PageController(
                                                      initialPage: min(
                                                          0, manga.length - 1)),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: manga.length,
                                              itemBuilder:
                                                  (context, mangaIndex) {
                                                final mangaItem =
                                                    manga[mangaIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'Manga',
                                                      queryParams: {
                                                        'title': serializeParam(
                                                          valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                                      mangaItem,
                                                                      r'''$.attributes.title.en''',
                                                                    ) ==
                                                                    'null'
                                                                ? 'N/A'
                                                                : getJsonField(
                                                                    mangaItem,
                                                                    r'''$.attributes.title.en''',
                                                                  ).toString(),
                                                            'N/A',
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                        'desc': serializeParam(
                                                          valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                                      mangaItem,
                                                                      r'''$.attributes.description.en''',
                                                                    ) ==
                                                                    'null'
                                                                ? 'N/A'
                                                                : getJsonField(
                                                                    mangaItem,
                                                                    r'''$.attributes.description.en''',
                                                                  ).toString(),
                                                            'N/A',
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                        'src': serializeParam(
                                                          'https://uploads.mangadex.org/covers/${getJsonField(
                                                            mangaItem,
                                                            r'''$.id''',
                                                          ).toString()}/${getJsonField(
                                                            mangaItem,
                                                            r'''$.relationships[:].attributes.fileName''',
                                                          ).toString()}',
                                                          ParamType.String,
                                                        ),
                                                        'id': serializeParam(
                                                          getJsonField(
                                                            mangaItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              'https://uploads.mangadex.org/covers/${getJsonField(
                                                            mangaItem,
                                                            r'''$.id''',
                                                          ).toString()}/${getJsonField(
                                                            mangaItem,
                                                            r'''$.relationships[:].attributes.fileName''',
                                                          ).toString()}',
                                                          width:
                                                              double.infinity,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.9, 0.9),
                                                        child: Container(
                                                          width: 160.0,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    mangaItem,
                                                                    r'''$.attributes.title.en''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            15,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium,
                                                                ),
                                                                Text(
                                                                  (getJsonField(
                                                                                mangaItem,
                                                                                r'''$.attributes.year''',
                                                                              ) ==
                                                                              null) ||
                                                                          (getJsonField(
                                                                                mangaItem,
                                                                                r'''$.attributes.year''',
                                                                              ) ==
                                                                              'null')
                                                                      ? 'N/A'
                                                                      : getJsonField(
                                                                          mangaItem,
                                                                          r'''$.attributes.year''',
                                                                        ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 4.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 4.0),
                                      child: Text(
                                        'Library',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Nunito',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('Library');
                                      },
                                      child: Text(
                                        'See All',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 44.0),
                                child: StreamBuilder<List<FavoritesRecord>>(
                                  stream: queryFavoritesRecord(
                                    queryBuilder: (favoritesRecord) =>
                                        favoritesRecord.where('user',
                                            isEqualTo: currentUserReference),
                                    limit: 10,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 100.0, 0.0, 100.0),
                                          child: SizedBox(
                                            width: 75.0,
                                            height: 75.0,
                                            child: SpinKitRipple(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 75.0,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<FavoritesRecord>
                                        wrapFavoritesRecordList =
                                        snapshot.data!;
                                    if (wrapFavoritesRecordList.isEmpty) {
                                      return Center(
                                        child: Container(
                                          height: 250.0,
                                          child: EmptyWidget(),
                                        ),
                                      );
                                    }
                                    return Wrap(
                                      spacing: 8.0,
                                      runSpacing: 8.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(
                                          wrapFavoritesRecordList.length,
                                          (wrapIndex) {
                                        final wrapFavoritesRecord =
                                            wrapFavoritesRecordList[wrapIndex];
                                        return FutureBuilder<ApiCallResponse>(
                                          future: GetChaptersCall.call(
                                            id: wrapFavoritesRecord.id,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 20.0),
                                                  child: SizedBox(
                                                    width: 75.0,
                                                    height: 75.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 75.0,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final containerGetChaptersResponse =
                                                snapshot.data!;
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'Manga',
                                                  queryParams: {
                                                    'title': serializeParam(
                                                      wrapFavoritesRecord.title,
                                                      ParamType.String,
                                                    ),
                                                    'desc': serializeParam(
                                                      wrapFavoritesRecord.desc,
                                                      ParamType.String,
                                                    ),
                                                    'src': serializeParam(
                                                      wrapFavoritesRecord.src,
                                                      ParamType.String,
                                                    ),
                                                    'id': serializeParam(
                                                      wrapFavoritesRecord.id,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                final favoritesUpdateData =
                                                    createFavoritesRecordData(
                                                  openedChapters: getJsonField(
                                                    containerGetChaptersResponse
                                                        .jsonBody,
                                                    r'''$.total''',
                                                  ),
                                                  numChapters: getJsonField(
                                                    containerGetChaptersResponse
                                                        .jsonBody,
                                                    r'''$.total''',
                                                  ),
                                                );
                                                await wrapFavoritesRecord
                                                    .reference
                                                    .update(
                                                        favoritesUpdateData);
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                                height: 255.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x230E151B),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 4.0, 4.0, 4.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              wrapFavoritesRecord
                                                                  .src,
                                                          width:
                                                              double.infinity,
                                                          height: 180.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          wrapFavoritesRecord
                                                              .title
                                                              .maybeHandleOverflow(
                                                            maxChars: 12,
                                                            replacement: '…',
                                                          ),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FutureBuilder<
                                                            ApiCallResponse>(
                                                          future:
                                                              GetChaptersCall
                                                                  .call(
                                                            id: wrapFavoritesRecord
                                                                .id,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      LinearProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final textGetChaptersResponse =
                                                                snapshot.data!;
                                                            return Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                () {
                                                                  if (wrapFavoritesRecord
                                                                          .openedChapters !=
                                                                      getJsonField(
                                                                        containerGetChaptersResponse
                                                                            .jsonBody,
                                                                        r'''$.total''',
                                                                      )) {
                                                                    return 'New Update';
                                                                  } else if (wrapFavoritesRecord
                                                                          .numChapters ==
                                                                      getJsonField(
                                                                        containerGetChaptersResponse
                                                                            .jsonBody,
                                                                        r'''$.total''',
                                                                      )) {
                                                                    return 'No Update';
                                                                  } else {
                                                                    return 'New Update';
                                                                  }
                                                                }(),
                                                                'No Update',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      () {
                                                                        if (getJsonField(
                                                                              containerGetChaptersResponse.jsonBody,
                                                                              r'''$.total''',
                                                                            ) !=
                                                                            wrapFavoritesRecord.openedChapters) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .tertiary;
                                                                        } else if (getJsonField(
                                                                              containerGetChaptersResponse.jsonBody,
                                                                              r'''$.total''',
                                                                            ) ==
                                                                            wrapFavoritesRecord.numChapters) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .tertiary;
                                                                        }
                                                                      }(),
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                    ),
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF181818),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'API (Manga & Chapters): MangaDex\nScanlation Group: credited/chapter',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                            ),
                                      ),
                                      SvgPicture.network(
                                        'https://mangadex.org/img/brand/mangadex-logo.svg',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
