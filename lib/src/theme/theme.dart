import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.lightBlueAccent,
  scaffoldBackgroundColor: Colors.grey[100],
  cardColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.lightBlueAccent,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.lightBlue[800]),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.blue[900]),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueAccent,
  scaffoldBackgroundColor: Colors.grey[900],
  cardColor: Colors.grey[800],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueAccent,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.blue[300]),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.blue[100]),
  ),
);

class ThemeProvider with ChangeNotifier {
  late ThemeData _currentTheme;

  ThemeProvider({required bool isDarkMode}) {
    _currentTheme = isDarkMode ? darkTheme : lightTheme;
  }

  ThemeData get getTheme => _currentTheme;

  void swapTheme() {
    _currentTheme = _currentTheme == lightTheme ? darkTheme : lightTheme;
    notifyListeners();
  }
}
