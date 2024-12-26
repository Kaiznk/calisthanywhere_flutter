import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart'; // Para la animación de confeti
import 'package:animated_text_kit/animated_text_kit.dart'; // Para animar el texto

class EndRoutPage extends StatefulWidget {
  @override
  _EndRoutPageState createState() => _EndRoutPageState();
}

class _EndRoutPageState extends State<EndRoutPage> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _startPlayer(); // Inicia el audio cuando la página se abre
  }

  @override
  void dispose() {
    _stopPlayer(); // Detiene el audio cuando la página se cierra
    super.dispose();
  }

  FutureOr<void> _startPlayer() async {
    _player = AudioPlayer();
    await _player.setAsset('assets/audio/clapping.mp3');
    _player.play();
  }

  void _stopPlayer() {
    _player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CalisthAnyWhere',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            // Texto animado
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Well done!',
                  textStyle: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Color(0xFFFFB41F),
                    Colors.pink,
                    Colors.blue,
                    Colors.green,
                  ],
                  textAlign: TextAlign.center,
                ),
              ],
              repeatForever: true,
            ),
            SizedBox(height: 30.0),
            // Animación de confeti
            Flexible(
              child: Lottie.asset(
                'assets/animations/confetti.json', // Asegúrate de tener este archivo
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20.0),
            // Imagen extra
            Flexible(
              child: Image.asset(
                'assets/images/well_donestr.png',
                width: double.infinity,
                height: 120.0,
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            // Botón de finalizar
            SizedBox(
              width: double.infinity,
              height: 60.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Finish',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
