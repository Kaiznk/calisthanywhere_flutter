import 'dart:async';
import 'package:calistenico/splash.dart';
import 'package:calistenico/src/pages/Ejercicios/detalles_page.dart';
import 'package:calistenico/src/pages/Ejercicios/suelo_page.dart';
import 'package:calistenico/src/pages/Ejercicios/barra_page.dart';
import 'package:calistenico/src/pages/Ejercicios/paralelas_page.dart';
import 'package:calistenico/src/pages/PersonalT/SignUpPage.dart';
import 'package:calistenico/src/pages/PersonalT/routineProcess/ejerTraining.dart';
import 'package:calistenico/src/pages/PersonalT/routineProcess/timerTraining.dart';
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
import 'package:backendless_sdk/backendless_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtener tema guardado
  bool isDarkMode = await ThemeProvider.getSavedTheme();

  // Inicializar Backendless
  await Backendless.initApp(
    applicationId: "E64A3656-6C21-495E-811B-66D223AE5176",
    androidApiKey: "C30DEE70-D417-488A-93C2-1E8B02A3AF87",
    iosApiKey: "95D364EF-21A1-4740-8D73-DC19F7A8C9D6",
  );

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
        'ejertraining': (context) => EjerRtraining(),
        'timerpage': (context) => TimerPage(),
        'timertraining': (context) => TimerTraining(),
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
