import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _PageNumber = prefs.getBool('ff_PageNumber') ?? _PageNumber;
    _PageTitle = prefs.getBool('ff_PageTitle') ?? _PageTitle;
    _Brightness = prefs.getDouble('ff_Brightness') ?? _Brightness;
    _Orientation = prefs.getBool('ff_Orientation') ?? _Orientation;
    _BackgroundColor = _colorFromIntValue(prefs.getInt('ff_BackgroundColor')) ??
        _BackgroundColor;
    _InteractablesColors =
        _colorFromIntValue(prefs.getInt('ff_InteractablesColors')) ??
            _InteractablesColors;
    _TextColor = _colorFromIntValue(prefs.getInt('ff_TextColor')) ?? _TextColor;
    _CardColor = _colorFromIntValue(prefs.getInt('ff_CardColor')) ?? _CardColor;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _PageNumber = true;
  bool get PageNumber => _PageNumber;
  set PageNumber(bool _value) {
    _PageNumber = _value;
    prefs.setBool('ff_PageNumber', _value);
  }

  bool _PageTitle = true;
  bool get PageTitle => _PageTitle;
  set PageTitle(bool _value) {
    _PageTitle = _value;
    prefs.setBool('ff_PageTitle', _value);
  }

  double _Brightness = 10;
  double get Brightness => _Brightness;
  set Brightness(double _value) {
    _Brightness = _value;
    prefs.setDouble('ff_Brightness', _value);
  }

  bool _Orientation = false;
  bool get Orientation => _Orientation;
  set Orientation(bool _value) {
    _Orientation = _value;
    prefs.setBool('ff_Orientation', _value);
  }

  Color _BackgroundColor = Color(4279243283);
  Color get BackgroundColor => _BackgroundColor;
  set BackgroundColor(Color _value) {
    _BackgroundColor = _value;
    prefs.setString('ff_BackgroundColor', _value.value.toString());
  }

  Color _InteractablesColors = Color(4294967295);
  Color get InteractablesColors => _InteractablesColors;
  set InteractablesColors(Color _value) {
    _InteractablesColors = _value;
    prefs.setString('ff_InteractablesColors', _value.value.toString());
  }

  Color _TextColor = Color(4294967295);
  Color get TextColor => _TextColor;
  set TextColor(Color _value) {
    _TextColor = _value;
    prefs.setString('ff_TextColor', _value.value.toString());
  }

  Color _CardColor = Color(4280361249);
  Color get CardColor => _CardColor;
  set CardColor(Color _value) {
    _CardColor = _value;
    prefs.setString('ff_CardColor', _value.value.toString());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
