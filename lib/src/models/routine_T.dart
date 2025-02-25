import 'package:calistenico/src/models/exercise_T.dart';

class RoutineT {
  late String nombRout, tipoR, foto;
  late int id, serieMax, serieMin, descanEjerc, descanSerie;
  late List<ExerciseT> ejercR;
  late List<int> repet;

  RoutineT(
    this.id,
    this.nombRout,
    this.serieMax,
    this.serieMin,
    this.descanEjerc,
    this.descanSerie,
    this.ejercR,
    this.repet,
    this.foto,
    this.tipoR,
  );

  factory RoutineT.fromMap(Map<String, dynamic> data) {
    print("Raw ejercR data: ${data['ejercR']}");
    List<ExerciseT> exercises = (data['ejercR'] as List<dynamic>?)
            ?.map((e) => ExerciseT.fromMap(e as Map<String, dynamic>))
            .toList() ??
        [];

    // Extraer reps directamente de cada ejercicio
    List<int> repetitions = exercises.map((e) => e.reps).toList();

    // Manejar el caso en el que `id` sea null
    int id = (data['id'] is double)
        ? (data['id'] as double).toInt()
        : (data['id'] as int?) ?? 1;

    return RoutineT(
      id,
      data['nombRout'] ?? '',
      (data['serieMax'] as num?)?.toInt() ?? 4,
      (data['serieMin'] as num?)?.toInt() ?? 2,
      (data['descanEjerc'] as num?)?.toInt() ?? 60,
      (data['descanSerie'] as num?)?.toInt() ?? 90,
      exercises,
      repetitions, // <-- Ahora debería tener los valores de reps correctos
      data['foto'] ?? '',
      data['tipoR'] ?? '',
    );
  }

  get length => null;
}
