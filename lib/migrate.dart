import 'package:calistenico/src/databases/exercisesDB.dart'; // Asegúrate de que exista o accede a la lista de ejercicios
import 'package:calistenico/src/models/exercise_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void migrateData() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final ExercisesDB exercisesDB =
      ExercisesDB(); // Suponiendo que tienes una clase similar a RoutinesDB
  List<Exercise> listaExercises =
      exercisesDB.getAll(); // Ajusta según cómo obtienes los datos

  // Migrar ejercicios
  for (var exercise in listaExercises) {
    await firestore.collection('exercises').add(exercise.toMap());
    print("Ejercicio '${exercise.nombre}' migrado exitosamente.");
  }
}
