import 'dart:async';

import 'package:calistenico/src/models/datos_rout.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class EjerRoutPage extends StatefulWidget {
  @override
  _EjerRoutPageState createState() => _EjerRoutPageState();
}

class _EjerRoutPageState extends State<EjerRoutPage> {
  late DatosRout datosRout;

  int _counter = 10;
  bool t = false;
  Timer? _timer;

  late AudioPlayer _player;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != Null) {
      datosRout = ModalRoute.of(context)?.settings.arguments as DatosRout;
    }
    if (t == false) {
      _startPlayer();
      if (datosRout.rutina.repet[datosRout.numEjer] > 10000) {
        _counter = datosRout.rutina.repet[datosRout.numEjer] - 10000;

        _startTimer();
      }
      t = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('CalisthAnyWhere'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xFF666464),
            child: Image(
                fit: BoxFit.contain,
                width: 450.0,
                height: 210.0,
                image: AssetImage('assets/images/' +
                    datosRout.rutina.ejercR[datosRout.numEjer].foto +
                    '.png')),
          ),
          ListTile(
            trailing: Text(
              'Round: ' + datosRout.numSerTemp.toString(),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Text(_cantRepets() + _textRepet(),
              style: TextStyle(fontSize: 20.0, color: const Color(0xFF003BEC))),
          SizedBox(
            height: 9.0,
          ),
          Text(
            datosRout.rutina.ejercR[datosRout.numEjer].nombre,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 13.0),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  children: <Widget>[
                    Text(datosRout.rutina.ejercR[datosRout.numEjer].descripcion)
                  ],
                )),
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
                  _pasarNext();
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 19.0),
                ),
              )),
        ],
      ),
    );
  }

  String _cantRepets() {
    if (datosRout.rutina.repet[datosRout.numEjer] == 9999) {
      return 'Max';
    } else if (datosRout.rutina.repet[datosRout.numEjer] > 10000) {
      return _counter.toString();
    } else if (datosRout.rutina.repet[datosRout.numEjer] < 0) {
      return ((datosRout.rutina.repet[datosRout.numEjer]) * (-1)).toString();
    } else {
      return datosRout.rutina.repet[datosRout.numEjer].toString();
    }
  }

  DatosRout _enviarDatos() {
    DatosRout newDatosRout;
    if ((datosRout.numEjer + 1) > (datosRout.rutina.ejercR.length - 1)) {
      newDatosRout = new DatosRout(
          datosRout.rutina, datosRout.numSerDef, datosRout.numSerTemp + 1, 0);
    } else {
      newDatosRout = new DatosRout(datosRout.rutina, datosRout.numSerDef,
          datosRout.numSerTemp, datosRout.numEjer + 1);
    }

    return newDatosRout;
  }

  String _textRepet() {
    if (datosRout.rutina.repet[datosRout.numEjer] == 1) {
      return " Repetition";
    } else if (datosRout.rutina.repet[datosRout.numEjer] > 10000) {
      return ' Hold!';
    } else {
      return ' Repetitions';
    }
  }

  void _pasarNext() {
    if ((datosRout.numSerTemp == datosRout.numSerDef) &&
        (datosRout.numEjer + 1 > datosRout.rutina.ejercR.length - 1)) {
      Navigator.pushReplacementNamed(context, 'endroutpage');
    } else {
      Navigator.pushReplacementNamed(context, 'timerpage',
          arguments: _enviarDatos());
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter -= 1;
        } else {
          Navigator.pushReplacementNamed(context, 'timerpage',
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
    _timer?.cancel();
    _player.dispose();
    _stopPlayer();
    super.dispose();
  }

  void _startPlayer() async {
    _player = AudioPlayer();
    await _player.setAsset('assets/audio/escuela_timbre.mp3');
    _player.play();
  }

  void _stopPlayer() {
    _player.stop();
  }
}
