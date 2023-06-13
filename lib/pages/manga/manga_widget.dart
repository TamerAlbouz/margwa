import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/manga_summary_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'manga_model.dart';
export 'manga_model.dart';

class MangaWidget extends StatefulWidget {
  const MangaWidget({
    Key? key,
    String? title,
    required this.desc,
    required this.src,
    required this.id,
    required this.format,
  })  : this.title = title ?? 'Manga',
        super(key: key);

  final String title;
  final String? desc;
  final String? src;
  final String? id;
  final List<String>? format;

  @override
  _MangaWidgetState createState() => _MangaWidgetState();
}

class _MangaWidgetState extends State<MangaWidget> {
  late MangaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MangaModel());
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Builder(
                  builder: (context) => Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showAlignedDialog(
                          barrierColor: Color(0x4D000000),
                          context: context,
                          isGlobal: true,
                          avoidOverflow: false,
                          targetAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          followerAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return Material(
                              color: Colors.transparent,
                              child: GestureDetector(
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: MangaSummaryWidget(
                                    title: widget.title,
                                    desc: widget.desc!,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 300.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 8.0),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 300.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      widget.src!,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 300.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.8, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                                Color(0x00101213)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 60.0,
                                                icon: Icon(
                                                  Icons.arrow_back_ios_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 32.0,
                                                ),
                                                onPressed: () async {
                                                  context.pop();
                                                },
                                              ),
                                              StreamBuilder<
                                                  List<FavoritesRecord>>(
                                                stream: queryFavoritesRecord(
                                                  queryBuilder: (favoritesRecord) =>
                                                      favoritesRecord
                                                          .where('user',
                                                              isEqualTo:
                                                                  currentUserReference)
                                                          .where('id',
                                                              isEqualTo:
                                                                  widget.id),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          size: 75.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<FavoritesRecord>
                                                      containerFavoritesRecordList =
                                                      snapshot.data!;
                                                  final containerFavoritesRecord =
                                                      containerFavoritesRecordList
                                                              .isNotEmpty
                                                          ? containerFavoritesRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          GetChaptersCall.call(
                                                        id: widget.id,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 40.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final rowGetChaptersResponse =
                                                            snapshot.data!;
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if ((containerFavoritesRecord !=
                                                                    null) &&
                                                                (widget.id ==
                                                                    containerFavoritesRecord!
                                                                        .id))
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    60.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 32.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  await containerFavoritesRecord!
                                                                      .reference
                                                                      .delete();
                                                                },
                                                              ),
                                                            if (!(containerFavoritesRecord !=
                                                                    null) ||
                                                                (containerFavoritesRecord!
                                                                        .id !=
                                                                    widget.id))
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    60.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 32.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  final favoritesCreateData =
                                                                      {
                                                                    ...createFavoritesRecordData(
                                                                      user:
                                                                          currentUserReference,
                                                                      id: widget
                                                                          .id,
                                                                      src: widget
                                                                          .src,
                                                                      title: widget
                                                                          .title,
                                                                      desc: widget
                                                                          .desc,
                                                                      numChapters:
                                                                          getJsonField(
                                                                        rowGetChaptersResponse
                                                                            .jsonBody,
                                                                        r'''$.total''',
                                                                      ),
                                                                      openedChapters:
                                                                          getJsonField(
                                                                        rowGetChaptersResponse
                                                                            .jsonBody,
                                                                        r'''$.total''',
                                                                      ),
                                                                    ),
                                                                    'tags': widget
                                                                        .format,
                                                                  };
                                                                  await FavoritesRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set(
                                                                          favoritesCreateData);
                                                                },
                                                              ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 20.0),
                                              child: AutoSizeText(
                                                widget.title
                                                    .maybeHandleOverflow(
                                                  maxChars: 20,
                                                  replacement: '…',
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 16.0),
                                              child: Icon(
                                                Icons.touch_app,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 32.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: StreamBuilder<List<ChaptersRecord>>(
                    stream: queryChaptersRecord(
                      queryBuilder: (chaptersRecord) => chaptersRecord
                          .where('manga_id', isEqualTo: widget.id)
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
                      List<ChaptersRecord> containerChaptersRecordList =
                          snapshot.data!;
                      final containerChaptersRecord =
                          containerChaptersRecordList.isNotEmpty
                              ? containerChaptersRecordList.first
                              : null;
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: PagedListView<ApiPagingParams, dynamic>(
                          pagingController: () {
                            if (_model.pagingController != null) {
                              return _model.pagingController!;
                            }

                            _model.pagingController = PagingController(
                              firstPageKey: ApiPagingParams(
                                nextPageNumber: 0,
                                numItems: 0,
                                lastResponse: null,
                              ),
                            );
                            _model.pagingController!
                                .addPageRequestListener((nextPageMarker) {
                              GetChaptersCall.call(
                                id: widget.id,
                                offset: nextPageMarker.numItems,
                              ).then((listViewGetChaptersResponse) {
                                final pageItems = (GetChaptersCall.data(
                                          listViewGetChaptersResponse.jsonBody,
                                        )!
                                            .map((e) => e)
                                            .toList() ??
                                        [])
                                    .toList() as List;
                                final newNumItems =
                                    nextPageMarker.numItems + pageItems.length;
                                _model.pagingController!.appendPage(
                                  pageItems,
                                  (pageItems.length > 0)
                                      ? ApiPagingParams(
                                          nextPageNumber:
                                              nextPageMarker.nextPageNumber + 1,
                                          numItems: newNumItems,
                                          lastResponse:
                                              listViewGetChaptersResponse,
                                        )
                                      : null,
                                );
                              });
                            });
                            return _model.pagingController!;
                          }(),
                          padding: EdgeInsets.zero,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate: PagedChildBuilderDelegate<dynamic>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 75.0,
                                height: 75.0,
                                child: SpinKitRipple(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 75.0,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, chaptersIndex) {
                              final chaptersItem = _model
                                  .pagingController!.itemList![chaptersIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (widget.format!.contains(
                                        '3e2b8dae-350e-4ab8-a8ce-016e844b9f0d')) {
                                      context.pushNamed(
                                        'ChapterWebtoon',
                                        queryParameters: {
                                          'title': serializeParam(
                                            getJsonField(
                                              listViewGetChaptersResponse
                                                  .jsonBody,
                                              r'''$.attributes.title''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'chapterId': serializeParam(
                                            getJsonField(
                                              listViewGetChaptersResponse
                                                  .jsonBody,
                                              r'''$.id''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'mangaid': serializeParam(
                                            widget.id,
                                            ParamType.String,
                                          ),
                                          'pages': serializeParam(
                                            getJsonField(
                                              listViewGetChaptersResponse
                                                  .jsonBody,
                                              r'''$.attributes.pages''',
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      context.pushNamed(
                                        'Chapter',
                                        queryParameters: {
                                          'title': serializeParam(
                                            getJsonField(
                                              listViewGetChaptersResponse
                                                  .jsonBody,
                                              r'''$.attributes.title''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'chapterId': serializeParam(
                                            getJsonField(
                                              listViewGetChaptersResponse
                                                  .jsonBody,
                                              r'''$.id''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'mangaid': serializeParam(
                                            widget.id,
                                            ParamType.String,
                                          ),
                                          'pages': serializeParam(
                                            getJsonField(
                                              listViewGetChaptersResponse
                                                  .jsonBody,
                                              r'''$.attributes.pages''',
                                            ),
                                            ParamType.int,
                                          ),
                                          'index': serializeParam(
                                            chaptersIndex,
                                            ParamType.int,
                                          ),
                                          'format': serializeParam(
                                            widget.format,
                                            ParamType.String,
                                            true,
                                          ),
                                          'items': serializeParam(
                                            (getJsonField(
                                              listViewGetChaptersResponse
                                                  .jsonBody,
                                              r'''$.data[:].id''',
                                            ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList(),
                                            ParamType.String,
                                            true,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }

                                    if ((containerChaptersRecord != null) &&
                                        (widget.id ==
                                            containerChaptersRecord!.mangaId)) {
                                      final chaptersUpdateData =
                                          createChaptersRecordData(
                                        chapterId: getJsonField(
                                          listViewGetChaptersResponse.jsonBody,
                                          r'''$.id''',
                                        ).toString(),
                                      );
                                      await containerChaptersRecord!.reference
                                          .update(chaptersUpdateData);
                                    } else {
                                      final chaptersCreateData =
                                          createChaptersRecordData(
                                        chapterId: getJsonField(
                                          listViewGetChaptersResponse.jsonBody,
                                          r'''$.id''',
                                        ).toString(),
                                        user: currentUserReference,
                                        mangaId: widget.id,
                                      );
                                      await ChaptersRecord.collection
                                          .doc()
                                          .set(chaptersCreateData);
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: (containerChaptersRecord !=
                                                  null) &&
                                              (containerChaptersRecord!
                                                      .chapterId ==
                                                  getJsonField(
                                                    listViewGetChaptersResponse
                                                        .jsonBody,
                                                    r'''$.id''',
                                                  ))
                                          ? FlutterFlowTheme.of(context).success
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          title: Text(
                                            () {
                                              if ((getJsonField(
                                                        listViewGetChaptersResponse
                                                            .jsonBody,
                                                        r'''$.attributes.title''',
                                                      ) !=
                                                      null) &&
                                                  (getJsonField(
                                                        listViewGetChaptersResponse
                                                            .jsonBody,
                                                        r'''$.attributes.title''',
                                                      ) !=
                                                      '')) {
                                                return getJsonField(
                                                  listViewGetChaptersResponse
                                                      .jsonBody,
                                                  r'''$.attributes.title''',
                                                ).toString();
                                              } else if (getJsonField(
                                                    listViewGetChaptersResponse
                                                        .jsonBody,
                                                    r'''$.attributes.volume''',
                                                  ) !=
                                                  null) {
                                                return 'Vol: ${getJsonField(
                                                  listViewGetChaptersResponse
                                                      .jsonBody,
                                                  r'''$.attributes.volume''',
                                                ).toString()} | Ch: ${getJsonField(
                                                  listViewGetChaptersResponse
                                                      .jsonBody,
                                                  r'''$.attributes.chapter''',
                                                ).toString()}';
                                              } else {
                                                return 'Ch: ${getJsonField(
                                                  listViewGetChaptersResponse
                                                      .jsonBody,
                                                  r'''$.attributes.chapter''',
                                                ).toString()}';
                                              }
                                            }(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                          subtitle: Text(
                                            () {
                                              if (((getJsonField(
                                                            listViewGetChaptersResponse
                                                                .jsonBody,
                                                            r'''$.attributes.title''',
                                                          ) !=
                                                          null) &&
                                                      (getJsonField(
                                                            listViewGetChaptersResponse
                                                                .jsonBody,
                                                            r'''$.attributes.title''',
                                                          ) !=
                                                          '')) &&
                                                  (getJsonField(
                                                        listViewGetChaptersResponse
                                                            .jsonBody,
                                                        r'''$.attributes.volume''',
                                                      ) !=
                                                      null)) {
                                                return 'Vol: ${getJsonField(
                                                  listViewGetChaptersResponse
                                                      .jsonBody,
                                                  r'''$.attributes.volume''',
                                                ).toString()} | Ch: ${getJsonField(
                                                  listViewGetChaptersResponse
                                                      .jsonBody,
                                                  r'''$.attributes.chapter''',
                                                ).toString()}';
                                              } else if (((getJsonField(
                                                            listViewGetChaptersResponse
                                                                .jsonBody,
                                                            r'''$.attributes.title''',
                                                          ) !=
                                                          null) &&
                                                      (getJsonField(
                                                            listViewGetChaptersResponse
                                                                .jsonBody,
                                                            r'''$.attributes.title''',
                                                          ) !=
                                                          '')) &&
                                                  (getJsonField(
                                                        listViewGetChaptersResponse
                                                            .jsonBody,
                                                        r'''$.attributes.volume''',
                                                      ) ==
                                                      null)) {
                                                return 'Ch: ${getJsonField(
                                                  listViewGetChaptersResponse
                                                      .jsonBody,
                                                  r'''$.attributes.chapter''',
                                                ).toString()}';
                                              } else {
                                                return '';
                                              }
                                            }(),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: (containerChaptersRecord !=
                                                              null) &&
                                                          (containerChaptersRecord!
                                                                  .chapterId ==
                                                              getJsonField(
                                                                listViewGetChaptersResponse
                                                                    .jsonBody,
                                                                r'''$.id''',
                                                              ))
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            size: 20.0,
                                          ),
                                          dense: false,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 1.0, 15.0, 0.0),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  (getJsonField(
                                                                listViewGetChaptersResponse
                                                                    .jsonBody,
                                                                r'''$.relationships[:].attributes.name''',
                                                              ) ==
                                                              'null') ||
                                                          (getJsonField(
                                                                listViewGetChaptersResponse
                                                                    .jsonBody,
                                                                r'''$.relationships[:].attributes.name''',
                                                              ) ==
                                                              null)
                                                      ? 'N/A'
                                                      : getJsonField(
                                                          listViewGetChaptersResponse
                                                              .jsonBody,
                                                          r'''$.relationships[:].attributes.name''',
                                                        ).toString(),
                                                  'N/A',
                                                ),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Nunito',
                                                      color: (containerChaptersRecord !=
                                                                  null) &&
                                                              (containerChaptersRecord!
                                                                      .chapterId ==
                                                                  getJsonField(
                                                                    listViewGetChaptersResponse
                                                                        .jsonBody,
                                                                    r'''$.id''',
                                                                  ))
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                              ),
                                              Text(
                                                (String date) {
                                                  return date.split("T")[0];
                                                }(getJsonField(
                                                  listViewGetChaptersResponse
                                                      .jsonBody,
                                                  r'''$.attributes.updatedAt''',
                                                ).toString()),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito',
                                                      color: (containerChaptersRecord !=
                                                                  null) &&
                                                              (containerChaptersRecord!
                                                                      .chapterId ==
                                                                  getJsonField(
                                                                    listViewGetChaptersResponse
                                                                        .jsonBody,
                                                                    r'''$.id''',
                                                                  ))
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
            ),
          ),
        ),
      ),
    );
  }
}
