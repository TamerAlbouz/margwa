import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({Key? key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    _model.textController ??= TextEditingController();
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
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
            'Margwa',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondary,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 4.0, 0.0),
                            child: Icon(
                              Icons.search_rounded,
                              color: Color(0xFFACB9C4),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 300),
                                  () async {
                                    setState(() =>
                                        _model.pagingController?.refresh());
                                    await _model.waitForOnePage();
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  suffixIcon: _model
                                          .textController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.textController?.clear();
                                            setState(() => _model
                                                .pagingController
                                                ?.refresh());
                                            await _model.waitForOnePage();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).primaryBackground,
                        FlutterFlowTheme.of(context).primaryBackground
                      ],
                      stops: [0.0, 0.35, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 10.0),
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
                            GetMangaCall.call(
                              offset: valueOrDefault<int>(
                                nextPageMarker.numItems,
                                0,
                              ),
                              title: _model.textController.text,
                              limit: 20,
                            ).then((listViewGetMangaResponse) {
                              final pageItems = (GetMangaCall.data(
                                        listViewGetMangaResponse.jsonBody,
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
                                        lastResponse: listViewGetMangaResponse,
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
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 75.0,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, mangaIndex) {
                            final mangaItem =
                                _model.pagingController!.itemList![mangaIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'Manga',
                                    queryParams: {
                                      'title': serializeParam(
                                        getJsonField(
                                          mangaItem,
                                          r'''$.attributes.title.en''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                      'desc': serializeParam(
                                        getJsonField(
                                          mangaItem,
                                          r'''$.attributes.description.en''',
                                        ).toString(),
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
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://uploads.mangadex.org/covers/${getJsonField(
                                          mangaItem,
                                          r'''$.id''',
                                        ).toString()}/${getJsonField(
                                          mangaItem,
                                          r'''$.relationships[:].attributes.fileName''',
                                        ).toString()}',
                                        width: 100.0,
                                        height: 150.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(8.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: 100.0,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(8.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                          ),
                                          child: ListTile(
                                            title: Text(
                                              (getJsonField(
                                                            mangaItem,
                                                            r'''$.attributes.title.en''',
                                                          ) !=
                                                          'null') ||
                                                      (getJsonField(
                                                            mangaItem,
                                                            r'''$.attributes.title.en''',
                                                          ) !=
                                                          null)
                                                  ? getJsonField(
                                                      mangaItem,
                                                      r'''$.attributes.title.en''',
                                                    ).toString()
                                                  : 'N/A'.maybeHandleOverflow(
                                                      maxChars: 20,
                                                      replacement: '…',
                                                    ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        lineHeight: 2.0,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              (getJsonField(
                                                            mangaItem,
                                                            r'''$.attributes.description.en''',
                                                          ) !=
                                                          'null') ||
                                                      (getJsonField(
                                                            mangaItem,
                                                            r'''$.attributes.description.en''',
                                                          ) !=
                                                          null)
                                                  ? getJsonField(
                                                      mangaItem,
                                                      r'''$.attributes.description.en''',
                                                    ).toString()
                                                  : 'N/A'.maybeHandleOverflow(
                                                      maxChars: 100,
                                                      replacement: '…',
                                                    ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            dense: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 20.0, 10.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(10.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
    );
  }
}
