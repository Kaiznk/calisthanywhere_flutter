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
  bool _isTimerStarted = false;
  Timer? _timer;

  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    datosRout = ModalRoute.of(context)?.settings.arguments as DatosRout;

    if (!_isTimerStarted) {
      _initializeTimerAndPlayer();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CalisthAnyWhere', style: TextStyle(fontSize: 22.0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageContainer(),
            const SizedBox(height: 16.0),
            Text('Round: ${datosRout.numSerTemp}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 20.0)),
            const SizedBox(height: 8.0),
            Text(_cantRepets() + _textRepet(),
                style:
                    const TextStyle(fontSize: 24.0, color: Color(0xFF003BEC))),
            const SizedBox(height: 9.0),
            Text(datosRout.rutina.ejercR[datosRout.numEjer].nombre,
                style: const TextStyle(
                    fontSize: 28.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Expanded(child: _buildDescriptionContainer()),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFFE0E0E6),
                  backgroundColor: const Color(0xFF0E0E0E),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: _handleNext,
                child: const Text('Next', style: TextStyle(fontSize: 21.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF666464),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: _isWebImage(datosRout.rutina.ejercR[datosRout.numEjer].foto)
              ? Image.network(
                  datosRout.rutina.ejercR[datosRout.numEjer].foto,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                )
              : Image.asset(
                  'assets/images/${datosRout.rutina.ejercR[datosRout.numEjer].foto}.png',
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
        ),
      ),
    );
  }

  bool _isWebImage(String path) {
    // Comprueba si el path es una URL válida
    final Uri? uri = Uri.tryParse(path);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  Widget _buildDescriptionContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF333333)
            : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        children: [
          Text(
            datosRout.rutina.ejercR[datosRout.numEjer].descripcion,
            style: TextStyle(
              fontSize: 18.0,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _initializeTimerAndPlayer() {
    _startPlayer();
    if (datosRout.rutina.repet[datosRout.numEjer] > 10000) {
      _counter = datosRout.rutina.repet[datosRout.numEjer] - 10000;
      _startTimer();
    }
    _isTimerStarted = true;
  }

  String _cantRepets() {
    final reps = datosRout.rutina.repet[datosRout.numEjer];
    if (reps == 9999) {
      return 'Max';
    } else if (reps > 10000) {
      return _counter.toString();
    } else if (reps < 0) {
      return (-reps).toString();
    } else {
      return reps.toString();
    }
  }

  String _textRepet() {
    final reps = datosRout.rutina.repet[datosRout.numEjer];
    if (reps == 1) {
      return " Repetition";
    } else if (reps > 10000) {
      return ' Hold!';
    } else {
      return ' Repetitions';
    }
  }

  DatosRout _getNextDatosRout() {
    final isLastExercise =
        (datosRout.numEjer + 1) > (datosRout.rutina.ejercR.length - 1);
    return isLastExercise
        ? DatosRout(
            datosRout.rutina, datosRout.numSerDef, datosRout.numSerTemp + 1, 0)
        : DatosRout(datosRout.rutina, datosRout.numSerDef, datosRout.numSerTemp,
            datosRout.numEjer + 1);
  }

  void _handleNext() {
    _player.stop();
    final isRoutineComplete = (datosRout.numSerTemp == datosRout.numSerDef) &&
        ((datosRout.numEjer + 1) > datosRout.rutina.ejercR.length - 1);

    if (isRoutineComplete) {
      Navigator.pushReplacementNamed(context, 'endroutpage');
    } else {
      Navigator.pushReplacementNamed(context, 'timerpage',
          arguments: _getNextDatosRout());
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _handleNext();
        }
      });
    });
  }

  Future<void> _startPlayer() async {
    try {
      if (_player.playing) {
        await _player.stop();
      }
      await _player.setAsset('assets/audio/boxing_b.mp3');
      _player.play();
    } catch (e) {
      debugPrint("Error al reproducir el audio: $e");
    }
  }
}
