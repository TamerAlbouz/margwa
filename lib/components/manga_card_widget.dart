import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'manga_card_model.dart';
export 'manga_card_model.dart';

class MangaCardWidget extends StatefulWidget {
  const MangaCardWidget({
    Key? key,
    this.id,
    this.fileName,
    this.title,
    this.desc,
  }) : super(key: key);

  final String? id;
  final String? fileName;
  final String? title;
  final String? desc;

  @override
  _MangaCardWidgetState createState() => _MangaCardWidgetState();
}

class _MangaCardWidgetState extends State<MangaCardWidget> {
  late MangaCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MangaCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
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
              'https://uploads.mangadex.org/covers/${widget.id}/${widget.fileName}',
              width: 100.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ClipRRect(
              child: Container(
                width: 100.0,
                height: 150.0,
                decoration: BoxDecoration(),
                child: ListTile(
                  title: Text(
                    widget.title!.maybeHandleOverflow(
                      maxChars: 25,
                      replacement: '…',
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Nunito',
                          lineHeight: 2.0,
                        ),
                  ),
                  subtitle: Text(
                    widget.desc!.maybeHandleOverflow(
                      maxChars: 100,
                      replacement: '…',
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondary,
                  dense: true,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(10.0),
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
    );
  }
}
