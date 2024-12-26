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
    List<Exercise> exercises = (data['ejercR'] as List)
        .map((e) => Exercise.fromMap(e as Map<String, dynamic>))
        .toList();

    List<int> repetitions = (data['repet'] as List?)?.cast<int>() ?? [];

    // Si repet está vacío, se asigna 1 a cada ejercicio
    if (repetitions.isEmpty) {
      repetitions = List<int>.filled(exercises.length, 1);
    }

    // Intentar castear `id` a `int`, si falla, asignar 1
    int id;
    try {
      id = int.parse(data['id'].toString());
    } catch (e) {
      id = 1; // Valor por defecto si la conversión falla
    }

    return Routine(
      id,
      data['nombreRout'] ?? '',
      data['serieMax'] ?? 1,
      data['serieMin'] ?? 1,
      data['descanEjerc'] ?? 60,
      data['descanSerie'] ?? 90,
      exercises,
      repetitions,
      data['foto'] ?? '',
      data['tipoR'] ?? '',
    );
  }
}
