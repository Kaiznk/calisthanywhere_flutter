import 'dart:async';
import 'package:calistenico/src/models/datos_rout.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late DatosRout _datosRout;
  late int _counter = 10;
  bool t = false;
  late Timer _timer;
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer(); // Inicialización en initState
  }

  @override
  Widget build(BuildContext context) {
    // Determina el brillo del tema actual
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    // Colores adaptativos
    final Color primaryTextColor = isDarkTheme ? Colors.white : Colors.black;
    final Color secondaryTextColor =
        isDarkTheme ? Colors.grey[400]! : Colors.grey[800]!;
    final Color counterColor =
        isDarkTheme ? Colors.red[300]! : Color(0xFFC6192D);

    if (ModalRoute.of(context)?.settings.arguments != Null) {
      _datosRout = ModalRoute.of(context)?.settings.arguments as DatosRout;
    }
    if (!t) {
      _counter = _datosRout.numEjer == 0
          ? _datosRout.rutina.descanSerie
          : (_datosRout.rutina.repet[_datosRout.numEjer] < 0
              ? 2
              : _datosRout.rutina.descanEjerc);
      _startTimer();
      _startPlayer();
      t = true;
    }

    // Verifica si la imagen es una URL válida o un recurso local
    final String imagePath = _datosRout.rutina.ejercR[_datosRout.numEjer].foto;
    final ImageProvider imageProvider =
        Uri.tryParse(imagePath)?.hasAbsolutePath == true
            ? NetworkImage(imagePath)
            : AssetImage('assets/images/$imagePath.png') as ImageProvider;

    return Scaffold(
      appBar: AppBar(
        title: Text('CalisthAnyWhere'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 35.0),
            Text(
              'Break',
              style: TextStyle(
                fontSize: 30.0,
                color: primaryTextColor,
                fontFamily: 'sans-serif-medium',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 50.0,
                color: counterColor,
              ),
            ),
            SizedBox(height: 50.0),
            Text(
              'Next Exercises',
              style: TextStyle(
                fontSize: 16.0,
                color: secondaryTextColor,
                fontFamily: 'sans-serif',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.only(bottom: 9.0),
              height: 130.0,
              child: Image(image: imageProvider),
            ),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Text(
                  _datosRout.rutina.ejercR[_datosRout.numEjer].nombre,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: primaryTextColor,
                    fontFamily: 'sans-serif',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(17.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFFE0E0E6),
                  backgroundColor: Color(0xFF0E0E0E),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  _stopPlayer();
                  Navigator.pushReplacementNamed(
                    context,
                    'ejerroutpage',
                    arguments: _enviarDatos(),
                  );
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 19.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter -= 1;
        } else {
          _timer.cancel();
          _stopPlayer();
          Navigator.pushReplacementNamed(context, 'ejerroutpage',
              arguments: _enviarDatos());
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _stopPlayer();
    _player.dispose();
    super.dispose();
  }

  DatosRout _enviarDatos() {
    return DatosRout(
      _datosRout.rutina,
      _datosRout.numSerDef,
      _datosRout.numSerTemp,
      _datosRout.numEjer,
    );
  }

  void _startPlayer() async {
    await _player.setAsset('assets/audio/clock.mp3');
    _player.setLoopMode(LoopMode.all);
    _player.play();
  }

  void _stopPlayer() {
    if (_player.playing) {
      _player.stop();
    }
  }
}
