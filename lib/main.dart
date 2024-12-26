import 'dart:async';
import 'package:calistenico/splash.dart';
import 'package:calistenico/src/databases/exercisesDBPT.dart';
import 'package:calistenico/src/pages/Ejercicios/detalles_page.dart';
import 'package:calistenico/src/pages/Ejercicios/suelo_page.dart';
import 'package:calistenico/src/pages/Ejercicios/barra_page.dart';
import 'package:calistenico/src/pages/Ejercicios/paralelas_page.dart';
import 'package:calistenico/src/pages/PersonalT/SignUpPage.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool("isDarkTheme") ?? false;
/*
  // Llamar a la función para subir ejercicios
  final exercisesDB = ExercisesDBPT();
  await exercisesDB.uploadExercisesToFirestore(exercisesDB.getListExer());
*/
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkMode: isDarkMode),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalisthAnyWhere',
      theme: themeProvider.getTheme,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => SplashScreen(),
        'home': (context) => HomePage(),
        'floor': (context) => SueloPage(),
        'parallel bars': (context) => ParalelasPage(),
        'bar': (context) => BarraPage(),
        'detalle': (context) => DetallesPage(),
        'routine_initial': (context) => RoutineInitialPage(),
        'ejerroutpage': (context) => EjerRoutPage(),
        'timerpage': (context) => TimerPage(),
        'endroutpage': (context) => EndRoutPage(),
        'newroutine': (context) => NewRoutine(),
        'exercnewrout': (context) => ExercNewRoutine(),
        'exercnewrout2': (context) => ExercNewRoutine2(),
        'settings': (context) => SettingsPage(),
        'information': (context) => InformationPage(),
        'privacyp': (context) => PrivacyPage(),
        'signup': (context) => SignUpPage(),
      },
    );
  }
}
