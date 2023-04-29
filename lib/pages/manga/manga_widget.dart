import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
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
  })  : this.title = title ?? 'Manga',
        super(key: key);

  final String title;
  final String? desc;
  final String? src;
  final String? id;

  @override
  _MangaWidgetState createState() => _MangaWidgetState();
}

class _MangaWidgetState extends State<MangaWidget> {
  late MangaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MangaModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
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
            widget.title,
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(0.0),
                        ),
                        child: Image.network(
                          widget.src!,
                          width: 100.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                              child: Text(
                                widget.desc!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      setState(() => _model.pagingController?.refresh());
                      await _model.waitForOnePage();
                    },
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
                                      lastResponse: listViewGetChaptersResponse,
                                    )
                                  : null,
                            );
                          });
                        });
                        return _model.pagingController!;
                      }(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<dynamic>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 100.0,
                            height: 100.0,
                            child: SpinKitRipple(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 100.0,
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, chaptersIndex) {
                          final chaptersItem =
                              _model.pagingController!.itemList![chaptersIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 5.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'Chapter',
                                  queryParams: {
                                    'title': serializeParam(
                                      getJsonField(
                                        chaptersItem,
                                        r'''$.attributes.title''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'chapterId': serializeParam(
                                      getJsonField(
                                        chaptersItem,
                                        r'''$.id''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  () {
                                    if ((getJsonField(
                                              chaptersItem,
                                              r'''$.attributes.title''',
                                            ) !=
                                            null) &&
                                        (getJsonField(
                                              chaptersItem,
                                              r'''$.attributes.title''',
                                            ) !=
                                            '')) {
                                      return getJsonField(
                                        chaptersItem,
                                        r'''$.attributes.title''',
                                      ).toString();
                                    } else if (getJsonField(
                                          chaptersItem,
                                          r'''$.attributes.volume''',
                                        ) !=
                                        null) {
                                      return 'Vol: ${getJsonField(
                                        chaptersItem,
                                        r'''$.attributes.volume''',
                                      ).toString()} | Ch: ${getJsonField(
                                        chaptersItem,
                                        r'''$.attributes.chapter''',
                                      ).toString()}';
                                    } else {
                                      return 'Ch: ${getJsonField(
                                        chaptersItem,
                                        r'''$.attributes.chapter''',
                                      ).toString()}';
                                    }
                                  }(),
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                                subtitle: Text(
                                  () {
                                    if (((getJsonField(
                                                  chaptersItem,
                                                  r'''$.attributes.title''',
                                                ) !=
                                                null) &&
                                            (getJsonField(
                                                  chaptersItem,
                                                  r'''$.attributes.title''',
                                                ) !=
                                                '')) &&
                                        (getJsonField(
                                              chaptersItem,
                                              r'''$.attributes.volume''',
                                            ) !=
                                            null)) {
                                      return 'Vol: ${getJsonField(
                                        chaptersItem,
                                        r'''$.attributes.volume''',
                                      ).toString()} | Ch: ${getJsonField(
                                        chaptersItem,
                                        r'''$.attributes.chapter''',
                                      ).toString()}';
                                    } else if (((getJsonField(
                                                  chaptersItem,
                                                  r'''$.attributes.title''',
                                                ) !=
                                                null) &&
                                            (getJsonField(
                                                  chaptersItem,
                                                  r'''$.attributes.title''',
                                                ) !=
                                                '')) &&
                                        (getJsonField(
                                              chaptersItem,
                                              r'''$.attributes.volume''',
                                            ) ==
                                            null)) {
                                      return 'Ch: ${getJsonField(
                                        chaptersItem,
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  size: 20.0,
                                ),
                                tileColor:
                                    FlutterFlowTheme.of(context).secondary,
                                dense: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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