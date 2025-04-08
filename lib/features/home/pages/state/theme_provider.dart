import 'package:flutter/material.dart';

//Observador - Observer
class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  //Ação - Action
  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    //Reaction - Side Effect
    notifyListeners();
  }
}
