import 'package:shared_preferences/shared_preferences.dart';

class SharePrefsApp {
  final String colorKey = 'colorKey';
  static late SharedPreferences _sharedPreferences;
  static late SharePrefsApp _instance;

  SharePrefsApp._internal();

  factory SharePrefsApp() {
    _instance = SharePrefsApp._internal();
    return _instance;
  }

  Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future setColor(int value) {
    return _sharedPreferences.setInt(colorKey, value);
  }

  int getColor() {
    int? color = _sharedPreferences.getInt(colorKey);
    color ??= 0xFF70d8a9;
    return color;
  }
}
