import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: valueOrDefault<Color>(
        FFAppState().BackgroundColor,
        FlutterFlowTheme.of(context).primaryBackground,
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
        title: Text(
          'Settings',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Nunito',
                color: FFAppState().TextColor,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Choose what notifcations you want to recieve below and we will update the settings.',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Nunito',
                            color: FFAppState().TextColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: SwitchListTile.adaptive(
                value: _model.switchListTileValue1 ??= true,
                onChanged: (newValue) async {
                  setState(() => _model.switchListTileValue1 = newValue!);
                },
                title: Text(
                  'Push Notifications',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Nunito',
                        color: FFAppState().TextColor,
                      ),
                ),
                subtitle: Text(
                  'Receive Push notifications from our application on a semi regular basis.',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Nunito',
                        color: FFAppState().TextColor,
                      ),
                ),
                activeColor: FlutterFlowTheme.of(context).primaryText,
                activeTrackColor: FlutterFlowTheme.of(context).primary,
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              ),
            ),
            SwitchListTile.adaptive(
              value: _model.switchListTileValue2 ??= true,
              onChanged: (newValue) async {
                setState(() => _model.switchListTileValue2 = newValue!);
              },
              title: Text(
                'Email Notifications',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Nunito',
                      color: FFAppState().TextColor,
                    ),
              ),
              subtitle: Text(
                'Receive email notifications from our marketing team about new features.',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Nunito',
                      color: FFAppState().TextColor,
                    ),
              ),
              activeColor: FlutterFlowTheme.of(context).primaryText,
              activeTrackColor: FlutterFlowTheme.of(context).primary,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Colours & Themes',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Nunito',
                          color: FFAppState().TextColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      FFAppState().update(() {
                        FFAppState().BackgroundColor =
                            FlutterFlowTheme.of(context).primaryBackground;
                        FFAppState().InteractablesColors =
                            FlutterFlowTheme.of(context).primaryText;
                        FFAppState().TextColor =
                            FlutterFlowTheme.of(context).primaryText;
                        FFAppState().CardColor =
                            FlutterFlowTheme.of(context).secondary;
                      });
                    },
                    text: 'Reset',
                    options: FFButtonOptions(
                      height: 35.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final _colorPicked1Color = await showFFColorPicker(
                  context,
                  currentColor: _model.colorPicked1 ??=
                      FlutterFlowTheme.of(context).primaryBackground,
                  showRecentColors: true,
                  allowOpacity: true,
                  textColor: FlutterFlowTheme.of(context).primaryText,
                  secondaryTextColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  primaryButtonBackgroundColor:
                      FlutterFlowTheme.of(context).primary,
                  primaryButtonTextColor: Colors.white,
                  primaryButtonBorderColor: Colors.transparent,
                  displayAsBottomSheet: isMobileWidth(context),
                );

                if (_colorPicked1Color != null) {
                  setState(() => _model.colorPicked1 = _colorPicked1Color);
                }

                setState(() {
                  FFAppState().BackgroundColor = _model.colorPicked1!;
                });
              },
              child: ListTile(
                title: Text(
                  'Background',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Nunito',
                        color: FFAppState().TextColor,
                      ),
                ),
                subtitle: Text(
                  'Choose a background color',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Nunito',
                        color: FFAppState().TextColor,
                      ),
                ),
                trailing: Icon(
                  Icons.color_lens,
                  color: FFAppState().BackgroundColor,
                  size: 48.0,
                ),
                dense: false,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final _colorPicked2Color = await showFFColorPicker(
                  context,
                  currentColor: _model.colorPicked2 ??=
                      FlutterFlowTheme.of(context).primaryText,
                  showRecentColors: true,
                  allowOpacity: true,
                  textColor: FlutterFlowTheme.of(context).primaryText,
                  secondaryTextColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  primaryButtonBackgroundColor:
                      FlutterFlowTheme.of(context).primary,
                  primaryButtonTextColor: Colors.white,
                  primaryButtonBorderColor: Colors.transparent,
                  displayAsBottomSheet: isMobileWidth(context),
                );

                if (_colorPicked2Color != null) {
                  setState(() => _model.colorPicked2 = _colorPicked2Color);
                }

                FFAppState().update(() {
                  FFAppState().TextColor = _model.colorPicked2!;
                });
              },
              child: ListTile(
                title: Text(
                  'Text',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Nunito',
                        color: FFAppState().TextColor,
                      ),
                ),
                subtitle: Text(
                  'Choose a text color',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Nunito',
                        color: FFAppState().TextColor,
                      ),
                ),
                trailing: Icon(
                  Icons.color_lens,
                  color: FFAppState().TextColor,
                  size: 48.0,
                ),
                dense: false,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final _colorPicked3Color = await showFFColorPicker(
                  context,
                  currentColor: _model.colorPicked3 ??=
                      FlutterFlowTheme.of(context).primaryText,
                  showRecentColors: true,
                  allowOpacity: true,
                  textColor: FlutterFlowTheme.of(context).primaryText,
                  secondaryTextColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  primaryButtonBackgroundColor:
                      FlutterFlowTheme.of(context).primary,
                  primaryButtonTextColor: Colors.white,
                  primaryButtonBorderColor: Colors.transparent,
                  displayAsBottomSheet: isMobileWidth(context),
                );

                if (_colorPicked3Color != null) {
                  setState(() => _model.colorPicked3 = _colorPicked3Color);
                }

                FFAppState().update(() {
                  FFAppState().InteractablesColors = _model.colorPicked3!;
                });
              },
              child: ListTile(
                title: Text(
                  'Interactables',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Nunito',
                        color: FFAppState().TextColor,
                      ),
                ),
                subtitle: Text(
                  'Choose an Icon, Button, and navigation color',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Nunito',
                        color: FFAppState().TextColor,
                      ),
                ),
                trailing: Icon(
                  Icons.color_lens,
                  color: FFAppState().InteractablesColors,
                  size: 48.0,
                ),
                dense: false,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final _colorPicked4Color = await showFFColorPicker(
                  context,
                  currentColor: _model.colorPicked4 ??=
                      FlutterFlowTheme.of(context).secondary,
                  showRecentColors: true,
                  allowOpacity: true,
                  textColor: FlutterFlowTheme.of(context).primaryText,
                  secondaryTextColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  primaryButtonBackgroundColor:
                      FlutterFlowTheme.of(context).primary,
                  primaryButtonTextColor: Colors.white,
                  primaryButtonBorderColor: Colors.transparent,
                  displayAsBottomSheet: isMobileWidth(context),
                );

                if (_colorPicked4Color != null) {
                  setState(() => _model.colorPicked4 = _colorPicked4Color);
                }

                FFAppState().update(() {
                  FFAppState().CardColor = _model.colorPicked4!;
                });
              },
              child: ListTile(
                title: Text(
                  'Cards',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Nunito',
                        color: FFAppState().TextColor,
                      ),
                ),
                subtitle: Text(
                  'Choose an Icon, Button, and navigation color',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Nunito',
                        color: FFAppState().TextColor,
                      ),
                ),
                trailing: Icon(
                  Icons.color_lens,
                  color: FFAppState().TextColor,
                  size: 48.0,
                ),
                dense: false,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  context.goNamedAuth('LogIn', mounted);
                },
                text: 'Log Out',
                options: FFButtonOptions(
                  width: 190.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).error,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
