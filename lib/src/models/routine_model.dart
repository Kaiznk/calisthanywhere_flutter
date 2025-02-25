import 'package:calistenico/src/models/exercise_model.dart';

class Routine {
  late String nombRout, tipoR, foto;
  late int id, serieMax, serieMin, descanEjerc, descanSerie;
  late List<Exercise> ejercR;
  late List<int> repet;

  Routine(
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

  factory Routine.fromMap(Map<String, dynamic> data) {
    print("Raw ejercR data: ${data['ejercR']}");
    List<Exercise> exercises = (data['ejercR'] as List<dynamic>?)
            ?.map((e) => Exercise.fromMap(e as Map<String, dynamic>))
            .toList() ??
        [];

    List<int> repetitions = (data['repet'] as List?)?.cast<int>() ?? [];

    // Si repet está vacío, se asigna 1 a cada ejercicio
    if (repetitions.isEmpty) {
      repetitions = List<int>.filled(exercises.length, 1);
    }

    // Manejar el caso en el que `id` sea null
    int id = (data['id'] is double)
        ? (data['id'] as double).toInt()
        : (data['id'] as int?) ?? 1; // 👈 Evita el error

    return Routine(
      id,
      data['nombRout'] ?? '',
      (data['serieMax'] as num?)?.toInt() ?? 4, // 👈 Evita error si es null
      (data['serieMin'] as num?)?.toInt() ?? 2, // 👈 Evita error si es null
      (data['descanEjerc'] as num?)?.toInt() ?? 60, // 👈 Evita error si es null
      (data['descanSerie'] as num?)?.toInt() ?? 90, // 👈 Evita error si es null
      exercises,
      repetitions,
      data['foto'] ?? '',
      data['tipoR'] ?? '',
    );
  }
}
