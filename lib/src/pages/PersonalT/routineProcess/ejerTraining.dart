import 'dart:async';
import 'package:calistenico/src/models/exercise_T.dart';
import 'package:calistenico/src/models/routine_T.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class EjerRtraining extends StatefulWidget {
  @override
  _EjerRtrainingState createState() => _EjerRtrainingState();
}

class _EjerRtrainingState extends State<EjerRtraining> {
  late RoutineT routine;
  int _counter = 10;
  bool _isTimerStarted = false;
  Timer? _timer;
  late AudioPlayer _player;
  int _currentExerciseIndex = 0;
  int _currentSetIndex = 0;

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
    final receivedArgs = ModalRoute.of(context)?.settings.arguments;

    if (receivedArgs is RoutineT) {
      routine = receivedArgs;
      _currentExerciseIndex = 0;
      _currentSetIndex = 0;
      _counter = routine.descanEjerc;
    } else if (receivedArgs is Map<String, dynamic>) {
      _currentExerciseIndex = receivedArgs['nextExerciseIndex'];
      _currentSetIndex = receivedArgs['nextSetIndex'];
      routine = receivedArgs['routine'] as RoutineT;
      _counter = routine.descanEjerc;
    } else {
      throw Exception("Argumentos inválidos para TimerPage");
    }

    if (!_isTimerStarted) {
      _initializeTimerAndPlayer();
    }

    ExerciseT currentExercise = routine.ejercR[_currentExerciseIndex];
    int totalSets = currentExercise.serie;
    int reps = routine.repet[_currentExerciseIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('CalisthAnyWhere', style: TextStyle(fontSize: 22.0)),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageContainer(currentExercise.foto),
            const SizedBox(height: 16.0),
            Text('Set ${_currentSetIndex + 1} of $totalSets',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8.0),
            Text('$reps Repetitions',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.blueAccent)),
            const SizedBox(height: 9.0),
            Text(currentExercise.nombre,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8.0),
            Expanded(
                child: _buildDescriptionContainer(currentExercise.descripcion)),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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

  Widget _buildImageContainer(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Icon(Icons.error, color: Colors.red)),
        ),
      ),
    );
  }

  Widget _buildDescriptionContainer(String description) {
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
            description,
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
    _isTimerStarted = true;
  }

  void _handleNext() {
    _player.stop();
    setState(() {
      ExerciseT currentExercise = routine.ejercR[_currentExerciseIndex];
      if (_currentSetIndex < currentExercise.serie - 1) {
        _currentSetIndex++;
        _navigateToBreakPage();
      } else if (_currentExerciseIndex < routine.ejercR.length - 2) {
        _currentExerciseIndex++;
        _currentSetIndex = 0;
        _navigateToBreakPage();
      } else {
        Navigator.pushReplacementNamed(context, 'endroutpage');
      }
    });
  }

  void _navigateToBreakPage() {
    Navigator.pushReplacementNamed(context, 'timertraining', arguments: {
      'nextExerciseIndex': _currentExerciseIndex,
      'nextSetIndex': _currentSetIndex,
      'routine': routine,
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
