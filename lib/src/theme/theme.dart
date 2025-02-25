import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData;

  ThemeProvider({required bool isDarkMode}) {
    _themeData = isDarkMode ? darkTheme : lightTheme;
  }

  ThemeData get getTheme => _themeData;

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = _themeData == darkTheme;

    _themeData = isDarkMode ? lightTheme : darkTheme;
    await prefs.setBool("isDarkTheme", !isDarkMode); // Guarda el cambio
    notifyListeners();
  }

  static Future<bool> getSavedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isDarkTheme") ??
        false; // Si no existe, devuelve false (modo claro por defecto)
  }
}

// ======================= THEMES =======================

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.lightBlueAccent,
  scaffoldBackgroundColor: Colors.grey[100],
  cardColor: Colors.white,
  shadowColor: Colors.black26,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.lightBlueAccent,
    elevation: 4,
    shadowColor: Colors.black45,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  iconTheme: IconThemeData(color: Colors.blue[800]),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.blue[900], fontSize: 16),
    titleLarge: TextStyle(
      color: Colors.blue[800],
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.lightBlueAccent,
    textTheme: ButtonTextTheme.primary,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueAccent,
  scaffoldBackgroundColor: Colors.grey[900],
  cardColor: Colors.grey[850],
  shadowColor: Colors.black54,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueAccent,
    elevation: 4,
    shadowColor: Colors.black87,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  iconTheme: IconThemeData(color: Colors.blue[300]),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.blue[100], fontSize: 16),
    titleLarge: TextStyle(
      color: Colors.blue[100],
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blueAccent,
    textTheme: ButtonTextTheme.primary,
  ),
);
