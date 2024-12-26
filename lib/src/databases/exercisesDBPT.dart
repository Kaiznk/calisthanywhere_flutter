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
        'Heel Raise Squats',
        '⭐⭐',
        'Quads, Glutes, Calves',
        'Basic squat technique',
        'Strengthen calves and improve stability and balance.',
        'From a low squat position, lift your heels off the ground and hold briefly before lowering them.',
        'Engage your core and maintain balance when raising your heels. Avoid jerky movements.',
        'https://imgur.com/ZNVTS7B',
      ),
    ];

    return exerciseList;
  }
}
