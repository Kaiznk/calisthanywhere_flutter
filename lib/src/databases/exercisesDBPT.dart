import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:calistenico/src/models/exercise_model.dart';

class ExercisesDBPT {
  ExercisesDBPT();

  // Subir ejercicios a Backendless
  Future<void> uploadExercisesToBackendless(List<Exercise> exercises) async {
    for (var exercise in exercises) {
      // Convertir el ejercicio a un mapa para Backendless
      Map<String, dynamic> exerciseMap = exercise.toMap();

      try {
        // Subir el ejercicio a la tabla 'exercisesPT' usando save
        await Backendless.data.of('exercisesPT').save(exerciseMap);
        print('Ejercicio subido con éxito: $exercise');
      } catch (e) {
        print('Error al subir el ejercicio: $e');
      }
    }
  }

  // Obtener lista de ejercicios desde Backendless
  Future<List<Exercise>> getListExer() async {
    List<Exercise> exerciseList = [];

    try {
      // Obtener todos los ejercicios desde la tabla 'exercisesPT'
      var result = await Backendless.data.of('exercisesPT').find();

      // Convertir los resultados a objetos 'Exercise'
      for (var item in result!) {
        exerciseList.add(Exercise.fromMap(item as Map<String, dynamic>));
      }
    } catch (e) {
      print('Error al obtener los ejercicios: $e');
    }

    return exerciseList;
  }
}
