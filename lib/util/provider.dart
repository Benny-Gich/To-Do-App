import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

//Dark theme Settings

  final darkTheme = ThemeData(
    primaryColor: Colors.black12,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black12,
  );

//Light Theme Settings
  final lightTheme = ThemeData(
    primaryColor: Colors.green,
    brightness: Brightness.light,
    primaryColorLight: Colors.green,
  );

//Dark Theme Toggle Button
  changeTheme() {
    _isDark = !isDark;

    // Save my values
    storage.setBool("isDark", _isDark);
    notifyListeners();
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
}
