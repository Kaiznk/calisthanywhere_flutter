import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:audioplayers/audio_cache.dart';
// ignore: import_of_legacy_library_into_null_safe
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
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != Null) {
      _datosRout = ModalRoute.of(context)?.settings.arguments as DatosRout;
    }
    if (t == false) {
      if (_datosRout.numEjer == 0) {
        _counter = _datosRout.rutina.descanSerie;
      } else if (_datosRout.rutina.repet[_datosRout.numEjer] < 0) {
        _counter = 2;
      } else {
        _counter = _datosRout.rutina.descanEjerc;
      }
      _startTimer();
      _startPlayer();
      t = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('CalisthAnyWhere'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 35.0,
            ),
            Text(
              'Break',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xDD000000),
                  fontFamily: 'sans-serif-medium'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 50.0, color: Color(0xFFC6192D)),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text('Next Exercises',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xDD000000),
                    fontFamily: 'sans-serif',
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10.0,
            ),
            Container(
                margin: EdgeInsets.only(bottom: 9.0),
                height: 130.0,
                child: Image(
                    image: AssetImage('assets/images/' +
                        _datosRout.rutina.ejercR[_datosRout.numEjer].foto +
                        '.png'))),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Text(_datosRout.rutina.ejercR[_datosRout.numEjer].nombre,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xDD000000),
                        fontFamily: 'sans-serif',
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
                width: 440.0,
                margin: EdgeInsets.all(7.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: const Color(0xFF0E0E0E),
                  textColor: const Color(0xFFE0E0E6),
                  onPressed: () {
                    _stopPlayer();
                    Navigator.pushReplacementNamed(context, 'ejerroutpage',
                        arguments: _enviarDatos());
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 19.0),
                  ),
                )),
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _stopPlayer();
    _player.dispose();
  }

  DatosRout _enviarDatos() {
    DatosRout newDatosRout;
    newDatosRout = new DatosRout(_datosRout.rutina, _datosRout.numSerDef,
        _datosRout.numSerTemp, _datosRout.numEjer);

    return newDatosRout;
  }

  void _startPlayer() async {
    _player = AudioPlayer();
    await _player.setAsset('assets/audio/reloj_tictac.mp3');
    _player.setLoopMode(LoopMode.all);
    _player.play();
  }

  void _stopPlayer() {
    _player.stop();
  }
}
