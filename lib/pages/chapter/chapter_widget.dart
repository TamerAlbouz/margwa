import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
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
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
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
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: true,
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
              actions: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.crop_rotate,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().Orientation = !FFAppState().Orientation;
                    });
                  },
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
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
                            color: FlutterFlowTheme.of(context).alternate,
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
                          Builder(
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
                                height:
                                    MediaQuery.of(context).size.height * 0.93,
                                child: PageView.builder(
                                  allowImplicitScrolling: true,
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage:
                                              min(0, pagesH.length - 1)),
                                  onPageChanged: (_) => setState(() {}),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: pagesH.length,
                                  itemBuilder: (context, pagesHIndex) {
                                    final pagesHItem = pagesH[pagesHIndex];
                                    return Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      '${GetChapterPagesCall.url(
                                                        columnGetChapterPagesResponse
                                                            .jsonBody,
                                                      ).toString()}/data/${GetChapterPagesCall.hash(
                                                        columnGetChapterPagesResponse
                                                            .jsonBody,
                                                      ).toString()}/${pagesHItem}',
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag:
                                                        '${GetChapterPagesCall.url(
                                                      columnGetChapterPagesResponse
                                                          .jsonBody,
                                                    ).toString()}/data/${GetChapterPagesCall.hash(
                                                      columnGetChapterPagesResponse
                                                          .jsonBody,
                                                    ).toString()}/${pagesHItem}',
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: '${GetChapterPagesCall.url(
                                                columnGetChapterPagesResponse
                                                    .jsonBody,
                                              ).toString()}/data/${GetChapterPagesCall.hash(
                                                columnGetChapterPagesResponse
                                                    .jsonBody,
                                              ).toString()}/${pagesHItem}',
                                              transitionOnUserGestures: true,
                                              child: Image.network(
                                                '${GetChapterPagesCall.url(
                                                  columnGetChapterPagesResponse
                                                      .jsonBody,
                                                ).toString()}/data/${GetChapterPagesCall.hash(
                                                  columnGetChapterPagesResponse
                                                      .jsonBody,
                                                ).toString()}/${pagesHItem}',
                                                width: double.infinity,
                                                height: 750.0,
                                                fit: BoxFit.fitWidth,
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
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
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        value: downloadProgress
                                                                    .progress !=
                                                                null
                                                            ? downloadProgress
                                                                .progress
                                                            : 0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -0.85),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 2.5, 0.0),
                                            child: badges.Badge(
                                              badgeContent: Text(
                                                '${(pagesHIndex + 1).toString()}/${widget.pages?.toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                              showBadge: true,
                                              shape: badges.BadgeShape.circle,
                                              badgeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              elevation: 0.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 12.0),
                                              position:
                                                  badges.BadgePosition.topEnd(),
                                              animationType: badges
                                                  .BadgeAnimationType.scale,
                                              toAnimate: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        if (FFAppState().Orientation == false)
                          Flexible(
                            child: Builder(
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
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(pages.length,
                                        (pagesIndex) {
                                      final pagesItem = pages[pagesIndex];
                                      return Stack(
                                        children: [
                                          Image.network(
                                            '${GetChapterPagesCall.url(
                                              columnGetChapterPagesResponse
                                                  .jsonBody,
                                            ).toString()}/data/${GetChapterPagesCall.hash(
                                              columnGetChapterPagesResponse
                                                  .jsonBody,
                                            ).toString()}/${pagesItem}',
                                            width: double.infinity,
                                            fit: BoxFit.fitWidth,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
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
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    value: downloadProgress
                                                                .progress !=
                                                            null
                                                        ? downloadProgress
                                                            .progress
                                                        : 0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 2.5, 0.0),
                                              child: badges.Badge(
                                                badgeContent: Text(
                                                  '${(pagesIndex + 1).toString()}/${widget.pages?.toString()}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall,
                                                ),
                                                showBadge: true,
                                                shape: badges.BadgeShape.circle,
                                                badgeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 0.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 12.0, 12.0, 12.0),
                                                position: badges.BadgePosition
                                                    .topEnd(),
                                                animationType: badges
                                                    .BadgeAnimationType.scale,
                                                toAnimate: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
