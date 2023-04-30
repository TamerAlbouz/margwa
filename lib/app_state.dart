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

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _Orientation = prefs.getBool('ff_Orientation') ?? _Orientation;
    _PageNumber = prefs.getBool('ff_PageNumber') ?? _PageNumber;
    _PageTitle = prefs.getBool('ff_PageTitle') ?? _PageTitle;
    _Brightness = prefs.getDouble('ff_Brightness') ?? _Brightness;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _Orientation = true;
  bool get Orientation => _Orientation;
  set Orientation(bool _value) {
    _Orientation = _value;
    prefs.setBool('ff_Orientation', _value);
  }

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
