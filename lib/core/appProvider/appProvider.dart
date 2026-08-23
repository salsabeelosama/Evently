import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeMode(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }
}
