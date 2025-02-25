import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:calistenico/src/models/exercise_T.dart';
import 'package:calistenico/src/models/exercise_model.dart';
import 'package:calistenico/src/models/routine_T.dart';

class BackendlessService {
  Future<RoutineT?> fetchRoutineWithExercises(String routineId) async {
    try {
      // 1️⃣ Buscar la rutina junto con los ejercicios en "exercRoutClient"
      DataQueryBuilder queryRoutine = DataQueryBuilder()
        ..whereClause = "objectId = '$routineId'"
        ..relationsDepth = 1 // 🔥 Cargar relaciones automáticamente
        ..loadRelations = ["ejercR"]; // 🔥 Especificamos la relación a traer

      List? routineResult = await Backendless.data
          .of("routinesClient")
          .find(queryBuilder: queryRoutine);

      if (routineResult!.isEmpty) return null;

      var routineData = routineResult.first;

      print("🔍 Rutina obtenida: $routineData");

      RoutineT routine = RoutineT.fromMap(routineData);

      // 2️⃣ Verificar si los ejercicios están en la relación cargada
      if (routineData["ejercR"] != null) {
        List<dynamic> exercisesRaw = routineData["ejercR"];

        print("🔍 Raw ejercR data: $exercisesRaw");

        List<ExerciseT> exercises =
            exercisesRaw.map((e) => ExerciseT.fromMap(e)).toList();

        routine.ejercR = exercises;
      }

      return routine;
    } catch (e) {
      print("❌ Error cargando rutina y ejercicios: $e");
      return null;
    }
  }
}
