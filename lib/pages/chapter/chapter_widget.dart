import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    required this.mangaid,
    required this.pages,
  }) : super(key: key);

  final String? title;
  final String? chapterId;
  final String? mangaid;
  final int? pages;

  @override
  _ChapterWidgetState createState() => _ChapterWidgetState();
}

class _ChapterWidgetState extends State<ChapterWidget> {
  late ChapterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex1 => _model.pageViewController1 != null &&
          _model.pageViewController1!.hasClients &&
          _model.pageViewController1!.page != null
      ? _model.pageViewController1!.page!.round()
      : 0;
  int get pageViewCurrentIndex2 => _model.pageViewController2 != null &&
          _model.pageViewController2!.hasClients &&
          _model.pageViewController2!.page != null
      ? _model.pageViewController2!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChapterModel());
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
              color: FlutterFlowTheme.of(context).secondaryBackground,
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
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            '${valueOrDefault<String>(
              (pageViewCurrentIndex2 + 1).toString(),
              '0',
            )}/${widget.pages?.toString()}',
            style: FlutterFlowTheme.of(context).titleMedium,
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.menu_open,
                color: FlutterFlowTheme.of(context).primaryText,
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
                          final pagesH = (GetChapterPagesCall.data(
                                columnGetChapterPagesResponse.jsonBody,
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList()
                                  ?.map((e) => e)
                                  .toList()
                                  ?.toList() ??
                              [];
                          return Container(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  child: PageView.builder(
                                    allowImplicitScrolling: true,
                                    controller: _model.pageViewController1 ??=
                                        PageController(
                                            initialPage:
                                                min(0, pagesH.length - 1)),
                                    onPageChanged: (_) => setState(() {}),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pagesH.length,
                                    itemBuilder: (context, pagesHIndex) {
                                      final pagesHItem = pagesH[pagesHIndex];
                                      return CachedNetworkImage(
                                        imageUrl: '${GetChapterPagesCall.url(
                                          columnGetChapterPagesResponse
                                              .jsonBody,
                                        ).toString()}/data/${GetChapterPagesCall.hash(
                                          columnGetChapterPagesResponse
                                              .jsonBody,
                                        ).toString()}/${pagesHItem}',
                                        width: 100.0,
                                        height: 150.0,
                                        fit: BoxFit.fitWidth,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0,
                                              MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2 -
                                                  150.0,
                                              0,
                                              MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2 -
                                                  150.0),
                                          child: Center(
                                            child: SizedBox(
                                              width: 75,
                                              height: 75,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                value: downloadProgress
                                                            .progress !=
                                                        null
                                                    ? downloadProgress.progress
                                                    : 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
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
                      child: Builder(
                        builder: (context) {
                          final pagesH = (GetChapterPagesCall.data(
                                columnGetChapterPagesResponse.jsonBody,
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList()
                                  ?.map((e) => e)
                                  .toList()
                                  ?.toList() ??
                              [];
                          return Container(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              child: PageView.builder(
                                pageSnapping: false,
                                allowImplicitScrolling: true,
                                controller: _model.pageViewController2 ??=
                                    PageController(
                                        initialPage: min(0, pagesH.length - 1)),
                                onPageChanged: (_) => setState(() {}),
                                scrollDirection: Axis.vertical,
                                itemCount: pagesH.length,
                                itemBuilder: (context, pagesHIndex) {
                                  final pagesHItem = pagesH[pagesHIndex];
                                  return CachedNetworkImage(
                                    imageUrl: '${GetChapterPagesCall.url(
                                      columnGetChapterPagesResponse.jsonBody,
                                    ).toString()}/data/${GetChapterPagesCall.hash(
                                      columnGetChapterPagesResponse.jsonBody,
                                    ).toString()}/${pagesHItem}',
                                    width: double.infinity,
                                    fit: BoxFit.fitWidth,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0,
                                          MediaQuery.of(context).size.height /
                                                  2 -
                                              150.0,
                                          0,
                                          MediaQuery.of(context).size.height /
                                                  2 -
                                              150.0),
                                      child: Center(
                                        child: SizedBox(
                                          width: 75,
                                          height: 75,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            value: downloadProgress.progress !=
                                                    null
                                                ? downloadProgress.progress
                                                : 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
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
