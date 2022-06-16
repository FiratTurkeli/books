import 'package:books_app/models/darktheme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  String currentTheme = "light";

  ThemeMode get themeMode {
    if (currentTheme == "light") {
      return ThemeMode.light;
    }  else {
      return ThemeMode.dark;
    }
  }

  changeTheme(String theme) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString("theme", theme);
    currentTheme = theme;
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    currentTheme = _prefs.getString("theme") ?? "light" ;
    notifyListeners();
  }


}