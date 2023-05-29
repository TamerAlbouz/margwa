import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'chapter_webtoon_model.dart';
export 'chapter_webtoon_model.dart';

class ChapterWebtoonWidget extends StatefulWidget {
  const ChapterWebtoonWidget({
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
  _ChapterWebtoonWidgetState createState() => _ChapterWebtoonWidgetState();
}

class _ChapterWebtoonWidgetState extends State<ChapterWebtoonWidget> {
  late ChapterWebtoonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChapterWebtoonModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FutureBuilder<ApiCallResponse>(
                        future: GetChapterPagesCall.call(
                          chapterId: widget.chapterId,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 250.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: 75.0,
                                  height: 75.0,
                                  child: SpinKitRipple(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 75.0,
                                  ),
                                ),
                              ),
                            );
                          }
                          final listViewGetChapterPagesResponse =
                              snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final chapters = (GetChapterPagesCall.data(
                                    listViewGetChapterPagesResponse.jsonBody,
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
                                itemCount: chapters.length,
                                itemBuilder: (context, chaptersIndex) {
                                  final chaptersItem = chapters[chaptersIndex];
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        InkWell(
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
                                                  image: CachedNetworkImage(
                                                    imageUrl:
                                                        '${GetChapterPagesCall.url(
                                                      listViewGetChapterPagesResponse
                                                          .jsonBody,
                                                    ).toString()}/data/${GetChapterPagesCall.hash(
                                                      listViewGetChapterPagesResponse
                                                          .jsonBody,
                                                    ).toString()}/${chaptersItem}',
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag:
                                                      '${GetChapterPagesCall.url(
                                                    listViewGetChapterPagesResponse
                                                        .jsonBody,
                                                  ).toString()}/data/${GetChapterPagesCall.hash(
                                                    listViewGetChapterPagesResponse
                                                        .jsonBody,
                                                  ).toString()}/${chaptersItem}',
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: '${GetChapterPagesCall.url(
                                              listViewGetChapterPagesResponse
                                                  .jsonBody,
                                            ).toString()}/data/${GetChapterPagesCall.hash(
                                              listViewGetChapterPagesResponse
                                                  .jsonBody,
                                            ).toString()}/${chaptersItem}',
                                            transitionOnUserGestures: true,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '${GetChapterPagesCall.url(
                                                listViewGetChapterPagesResponse
                                                    .jsonBody,
                                              ).toString()}/data/${GetChapterPagesCall.hash(
                                                listViewGetChapterPagesResponse
                                                    .jsonBody,
                                              ).toString()}/${chaptersItem}',
                                              width: double.infinity,
                                              fit: BoxFit.fitWidth,
                                              errorWidget:
                                                  (context, error, stackTrace) {
                                                return Center(
                                                  child: Text(
                                                    'Error loading image: ${error.toString()}',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                );
                                              },
                                              progressIndicatorBuilder:
                                                  (BuildContext context,
                                                      String child,
                                                      DownloadProgress?
                                                          downloadProgress) {
                                                return Center(
                                                  heightFactor: 9,
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
                                                                  ?.progress !=
                                                              null
                                                          ? downloadProgress
                                                              ?.progress
                                                          : null,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 3.0, 3.0, 3.0),
                                              child: Text(
                                                '${(chaptersIndex + 1).toString()}/${widget.pages?.toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
