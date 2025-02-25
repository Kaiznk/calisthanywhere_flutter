import 'dart:async';
import 'package:calistenico/src/models/routine_T.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class TimerTraining extends StatefulWidget {
  @override
  _TimerTrainingState createState() => _TimerTrainingState();
}

class _TimerTrainingState extends State<TimerTraining> {
  late int _counter = 10;
  bool _isInitialized = false;
  late Timer _timer;
  late AudioPlayer _player;
  late Map<String, dynamic> args;
  late String nextExerciseImage;
  late String nextExerciseName;
  late int nextExerciseIndex;
  late int nextSetIndex;
  late RoutineT routine;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final Color primaryTextColor = isDarkTheme ? Colors.white : Colors.black;
    final Color counterColor =
        isDarkTheme ? Colors.redAccent : Color(0xFFC6192D);
    final Color buttonColor =
        isDarkTheme ? Colors.blueGrey[900]! : Colors.black;

    if (!_isInitialized) {
      args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      nextExerciseIndex = args['nextExerciseIndex'];
      nextSetIndex = args['nextSetIndex'];
      routine = args['routine'];
      nextExerciseImage = routine.ejercR[nextExerciseIndex].foto;
      nextExerciseName = routine.ejercR[nextExerciseIndex].nombre;
      _counter = routine.descanEjerc;
      _startTimer();
      _startPlayer();
      _isInitialized = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('CalisthAnyWhere', style: TextStyle(fontSize: 20.0)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Break',
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor)),
            SizedBox(height: 20.0),
            Text('$_counter',
                style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: counterColor)),
            SizedBox(height: 40.0),
            Text('Next Exercise',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 15.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                nextExerciseImage,
                height: 150.0,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.image_not_supported,
                    size: 100,
                    color: Colors.grey[400]),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              nextExerciseName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
              onPressed: _goToNextExercise,
              child: Text('Next', style: TextStyle(fontSize: 20.0)),
            ),
            SizedBox(height: 20.0),
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
          _goToNextExercise();
        }
      });
    });
  }

  void _goToNextExercise() {
    _stopPlayer();
    Navigator.pushReplacementNamed(
      context,
      'ejertraining',
      arguments: {
        'nextExerciseIndex': nextExerciseIndex,
        'nextSetIndex': nextSetIndex,
        'routine': routine,
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _stopPlayer();
    _player.dispose();
    super.dispose();
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
