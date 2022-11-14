import 'dart:core';

import 'package:calistenico/src/models/exercise_model.dart';

class Routine {
  late String nombRout, tipoR, foto;
  late int id, serieMax, serieMin, descanEjerc, descanSerie;
  late List<Exercise> ejercR;
  late List<int> repet;

  Routine(
    int id,
      String nombRout,
      int serieMax,
      int serieMin,
      int descanEjerc,
      int descanSerie,
      List<Exercise> ejercR,
      List<int> repet,
      String foto,
      String tipoR) {
        this.id = id;
    this.nombRout = nombRout;
    this.serieMax = serieMax;
    this.serieMin = serieMin;
    this.descanEjerc = descanEjerc;
    this.descanSerie = descanSerie;
    this.ejercR = ejercR;
    this.repet = repet;
    this.foto = foto;
    this.tipoR = tipoR;
  }
}
