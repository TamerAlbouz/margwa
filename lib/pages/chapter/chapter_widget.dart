import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chapter_model.dart';
export 'chapter_model.dart';

class ChapterWidget extends StatefulWidget {
  const ChapterWidget({
    Key? key,
    required this.title,
    required this.chapterId,
  }) : super(key: key);

  final String? title;
  final String? chapterId;

  @override
  _ChapterWidgetState createState() => _ChapterWidgetState();
}

class _ChapterWidgetState extends State<ChapterWidget> {
  late ChapterModel _model;

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
    _model = createModel(context, () => ChapterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: Drawer(
          elevation: 16.0,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 100.0, 20.0, 100.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Text(
                      'Brightness',
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Slider(
                      activeColor: FlutterFlowTheme.of(context).primary,
                      inactiveColor: FlutterFlowTheme.of(context).accent3,
                      min: 0.0,
                      max: 10.0,
                      value: _model.sliderValue ??= FFAppState().Brightness,
                      label: _model.sliderValue.toString(),
                      divisions: 10,
                      onChanged: (newValue) async {
                        newValue = double.parse(newValue.toStringAsFixed(0));
                        setState(() => _model.sliderValue = newValue);
                        FFAppState().Brightness = _model.sliderValue!;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      'Image Orientation',
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(40.0, 10.0, 40.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              FFAppState().Orientation = true;
                            });
                          },
                          text: 'H',
                          icon: Icon(
                            Icons.swap_horiz,
                            size: 24.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 15.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FFAppState().Orientation
                                ? FlutterFlowTheme.of(context).success
                                : FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              FFAppState().Orientation = false;
                            });
                          },
                          text: 'V',
                          icon: Icon(
                            Icons.swap_vert,
                            size: 24.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 15.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FFAppState().Orientation == false
                                ? FlutterFlowTheme.of(context).success
                                : FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      'Page',
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).accent2,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue1 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.checkboxValue1 = newValue!);
                            if (newValue!) {
                              FFAppState().PageNumber = true;
                            } else {
                              FFAppState().PageNumber = false;
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      Text(
                        'Number',
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).accent2,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue2 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.checkboxValue2 = newValue!);
                            if (newValue!) {
                              FFAppState().PageTitle = true;
                            } else {
                              FFAppState().PageTitle = false;
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      Text(
                        'Title',
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FFAppState().BackgroundColor,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: FFAppState().InteractablesColors,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Visibility(
            visible: FFAppState().PageTitle,
            child: Text(
              widget.title!,
              style: FlutterFlowTheme.of(context).titleMedium,
            ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.menu_open,
                color: FFAppState().InteractablesColors,
                size: 32.0,
              ),
              onPressed: () async {
                scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: FutureBuilder<ApiCallResponse>(
            future: GetChapterPagesCall.call(
              chapterId: widget.chapterId,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 75.0,
                    height: 75.0,
                    child: SpinKitRipple(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 75.0,
                    ),
                  ),
                );
              }
              final columnGetChapterPagesResponse = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (FFAppState().Orientation)
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final pagesH = ((GetChapterPagesCall.data(
                                    columnGetChapterPagesResponse.jsonBody,
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()
                                      ?.map((e) => e)
                                      .toList()
                                      ?.toList() ??
                                  [])
                              .take(10)
                              .toList();
                          return Container(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 50.0),
                                  child: PageView.builder(
                                    allowImplicitScrolling: true,
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage:
                                                min(0, pagesH.length - 1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pagesH.length,
                                    itemBuilder: (context, pagesHIndex) {
                                      final pagesHItem = pagesH[pagesHIndex];
                                      return Image.network(
                                        '${GetChapterPagesCall.url(
                                          columnGetChapterPagesResponse
                                              .jsonBody,
                                        ).toString()}/data/${GetChapterPagesCall.hash(
                                          columnGetChapterPagesResponse
                                              .jsonBody,
                                        ).toString()}/${pagesHItem}',
                                        width: 100.0,
                                        height: 150.0,
                                        fit: BoxFit.fitWidth,
                                        loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                                          if (loadingProgress == null) return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                              value: loadingProgress.expectedTotalBytes != null ? 
                                                     loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                     : null,
                                              ),
                                            );
                                          },
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.97),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage:
                                                  min(0, pagesH.length - 1)),
                                      count: pagesH.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: smooth_page_indicator
                                          .ExpandingDotsEffect(
                                        expansionFactor: 2.0,
                                        spacing: 4.0,
                                        radius: 8.0,
                                        dotWidth: 8.0,
                                        dotHeight: 8.0,
                                        dotColor: FlutterFlowTheme.of(context)
                                            .accent2,
                                        activeDotColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  if (FFAppState().Orientation == false)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final pages = (GetChapterPagesCall.data(
                                      columnGetChapterPagesResponse.jsonBody,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()
                                        ?.map((e) => e)
                                        .toList()
                                        ?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: pages.length,
                                  itemBuilder: (context, pagesIndex) {
                                    final pagesItem = pages[pagesIndex];
                                    return Image.network(
                                      '${GetChapterPagesCall.url(
                                        columnGetChapterPagesResponse.jsonBody,
                                      ).toString()}/data/${GetChapterPagesCall.hash(
                                        columnGetChapterPagesResponse.jsonBody,
                                      ).toString()}/${pagesItem}',
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth,
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
