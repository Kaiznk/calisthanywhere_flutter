import 'dart:async';

import 'package:calistenico/splash.dart';
import 'package:calistenico/src/pages/Ejercicios/detalles_page.dart';
import 'package:calistenico/src/pages/Ejercicios/suelo_page.dart';
import 'package:calistenico/src/pages/Ejercicios/barra_page.dart';
import 'package:calistenico/src/pages/Ejercicios/paralelas_page.dart';
import 'package:calistenico/src/pages/Rutina/ejer_rout_page.dart';
import 'package:calistenico/src/pages/Rutina/end_rout_page.dart';
import 'package:calistenico/src/pages/Rutina/newRoutine/exerc_newRoutine2_page.dart';
import 'package:calistenico/src/pages/Rutina/newRoutine/exerc_newRoutine_page.dart';
import 'package:calistenico/src/pages/Rutina/newRoutine/new_routine_page.dart';
import 'package:calistenico/src/pages/Rutina/routine_initail_page.dart';
import 'package:calistenico/src/pages/Rutina/timer_page.dart';
import 'package:calistenico/src/pages/home_page.dart';
import 'package:calistenico/src/pages/settings_pages/information_page.dart';
import 'package:calistenico/src/pages/settings_pages/privacy_page.dart';
import 'package:calistenico/src/pages/settings_pages/settings_page.dart';
import 'package:calistenico/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (BuildContext context) =>
        ThemeProvider(isDarkMode: prefs.getBool("isDarkTheme")),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CalisthAnyWhere',
        theme: themeProvider.getTheme,
        initialRoute: 'splash',
        routes: <String, WidgetBuilder>{
          'splash': (BuildContext context) => SplashScreen(),
          'home': (BuildContext context) => HomePage(),
          'floor': (BuildContext context) => SueloPage(),
          'parallel bars': (BuildContext context) => ParalelasPage(),
          'bar': (BuildContext context) => BarraPage(),
          'detalle': (BuildContext context) => DetallesPage(),
          'routine_initial': (BuildContext context) => RoutineInitialPage(),
          'ejerroutpage': (BuildContext context) => EjerRoutPage(),
          'timerpage': (BuildContext context) => TimerPage(),
          'endroutpage': (BuildContext context) => EndRoutPage(),
          'newroutine': (BuildContext context) => NewRoutine(),
          'exercnewrout': (BuildContext context) => ExercNewRoutine(),
          'exercnewrout2': (BuildContext context) => ExercNewRoutine2(),
          'settings': (BuildContext context) => SettingsPage(),
          'information': (BuildContext context) => InformationPage(),
          'privacyp': (BuildContext context) => PrivacyPage(),
        },
      );
    });
  }
}
