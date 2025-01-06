import 'dart:typed_data';
import 'package:calistenico/src/models/exercise_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;

class ExercisesDBPT {
  ExercisesDBPT();

  Future<void> uploadExercisesToFirestore(List<Exercise> exercises) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference exercisesCollection = firestore.collection(
        'exercisesPT'); // Colección donde se guardarán los ejercicios

    for (var exercise in exercises) {
      await exercisesCollection
          .add(exercise.toMap()); // Agrega el ejercicio a Firestore
    }
  }

  List<Exercise> getListExer() {
    final List<Exercise> exerciseList = [
      Exercise(
        'Chest Press Machine',
        '⭐⭐',
        'Chest, Triceps, Shoulders',
        'Maintain a stable seated position with handles at chest level.',
        'Strengthens the chest, triceps, and shoulders, and improves pushing strength.',
        'Sit on the machine with your back firmly against the pad. Push the handles forward until your arms are fully extended, then slowly return to the starting position.',
        'Keep your back flat against the pad and avoid locking your elbows during the extension phase. Control the movement throughout.',
        'https://imgur.com/YvNTcpO', // Reemplaza con la URL de la imagen correcta.
      ),
      Exercise(
        'Chest Flies Machine',
        '⭐⭐',
        'Pectorals, Shoulders',
        'Basic chest fly technique',
        'Enhances chest muscle definition and improves shoulder flexibility.',
        'Sit on the machine with your back firmly pressed against the pad. Grasp the handles and bring your arms together in front of your chest in a controlled motion. Slowly return to the starting position.',
        'Keep your elbows slightly bent to avoid joint strain. Maintain control during the movement and avoid locking out at the end of the motion.',
        'https://imgur.com/hSrCv52',
      ),
    ];

    return exerciseList;
  }
}
