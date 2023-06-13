import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    required this.index,
    required this.format,
    required this.items,
  }) : super(key: key);

  final String? title;
  final String? chapterId;
  final String? mangaid;
  final int? pages;
  final int? index;
  final List<String>? format;
  final List<String>? items;

  @override
  _ChapterWidgetState createState() => _ChapterWidgetState();
}

class _ChapterWidgetState extends State<ChapterWidget> {
  late ChapterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChapterModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.localChapterId = widget.chapterId;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              context.safePop();
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
              child: Text(
                '${(_model.pageViewCurrentIndex + 1).toString()}/${widget.pages?.toString()}',
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: GetChapterPagesCall.call(
                    chapterId: _model.localChapterId,
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
                    final pageViewGetChapterPagesResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final pages = (GetChapterPagesCall.data(
                              pageViewGetChapterPagesResponse.jsonBody,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList()
                                ?.map((e) => e)
                                .toList()
                                ?.toList() ??
                            [];
                        return Container(
                          width: double.infinity,
                          height: 500.0,
                          child: PageView.builder(
                            allowImplicitScrolling: true,
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage: min(0, pages.length - 1)),
                            onPageChanged: (_) => setState(() {}),
                            scrollDirection: Axis.horizontal,
                            itemCount: pages.length,
                            itemBuilder: (context, pagesIndex) {
                              final pagesItem = pages[pagesIndex];
                              return Container(
                                decoration: BoxDecoration(),
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
                                        child: FlutterFlowExpandedImageView(
                                          image: CachedNetworkImage(
                                            imageUrl:
                                                '${GetChapterPagesCall.url(
                                              pageViewGetChapterPagesResponse
                                                  .jsonBody,
                                            ).toString()}/data/${GetChapterPagesCall.hash(
                                              pageViewGetChapterPagesResponse
                                                  .jsonBody,
                                            ).toString()}/${pagesItem}',
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: '${GetChapterPagesCall.url(
                                            pageViewGetChapterPagesResponse
                                                .jsonBody,
                                          ).toString()}/data/${GetChapterPagesCall.hash(
                                            pageViewGetChapterPagesResponse
                                                .jsonBody,
                                          ).toString()}/${pagesItem}',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: '${GetChapterPagesCall.url(
                                      pageViewGetChapterPagesResponse.jsonBody,
                                    ).toString()}/data/${GetChapterPagesCall.hash(
                                      pageViewGetChapterPagesResponse.jsonBody,
                                    ).toString()}/${pagesItem}',
                                    transitionOnUserGestures: true,
                                    child: CachedNetworkImage(
                                      imageUrl: '${GetChapterPagesCall.url(
                                        pageViewGetChapterPagesResponse
                                            .jsonBody,
                                      ).toString()}/data/${GetChapterPagesCall.hash(
                                        pageViewGetChapterPagesResponse
                                            .jsonBody,
                                      ).toString()}/${pagesItem}',
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth,
                                      progressIndicatorBuilder: (BuildContext
                                              context,
                                          String child,
                                          DownloadProgress? downloadProgress) {
                                        return Center(
                                          heightFactor: 9,
                                          child: SizedBox(
                                            width: 75,
                                            height: 75,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              value: downloadProgress
                                                          ?.progress !=
                                                      null
                                                  ? downloadProgress?.progress
                                                  : null,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
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
              Container(
                width: double.infinity,
                height: 75.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: StreamBuilder<List<ChaptersRecord>>(
                    stream: queryChaptersRecord(
                      queryBuilder: (chaptersRecord) => chaptersRecord
                          .where('manga_id', isEqualTo: widget.mangaid)
                          .where('user', isEqualTo: currentUserReference),
                      singleRecord: true,
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
                      List<ChaptersRecord> rowChaptersRecordList =
                          snapshot.data!;
                      final rowChaptersRecord = rowChaptersRecordList.isNotEmpty
                          ? rowChaptersRecordList.first
                          : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              final chaptersUpdateData =
                                  createChaptersRecordData(
                                chapterId: widget.items?[widget.index! + 1],
                              );
                              await rowChaptersRecord!.reference
                                  .update(chaptersUpdateData);
                              setState(() {
                                _model.localChapterId =
                                    widget.format?[widget.index! + 1];
                              });
                            },
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.arrow_forward,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              final chaptersUpdateData =
                                  createChaptersRecordData(
                                chapterId: widget.items?[widget.index! - 1],
                              );
                              await rowChaptersRecord!.reference
                                  .update(chaptersUpdateData);
                              setState(() {
                                _model.localChapterId =
                                    widget.format?[widget.index! - 1];
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
