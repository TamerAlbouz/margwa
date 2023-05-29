import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
              context.pop();
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
              child: Text(
                '${(pageViewCurrentIndex + 1).toString()}/${widget.pages?.toString()}',
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
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage: min(0, pages.length - 1)),
                            scrollDirection: Axis.horizontal,
                            itemCount: pages.length,
                            itemBuilder: (context, pagesIndex) {
                              final pagesItem = pages[pagesIndex];
                              return Container(
                                decoration: BoxDecoration(),
                                child: CachedNetworkImage(
                                  imageUrl: '${GetChapterPagesCall.url(
                                    pageViewGetChapterPagesResponse.jsonBody,
                                  ).toString()}/data/${GetChapterPagesCall.hash(
                                    pageViewGetChapterPagesResponse.jsonBody,
                                  ).toString()}/${pagesItem}',
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
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
            ],
          ),
        ),
      ),
    );
  }
}
