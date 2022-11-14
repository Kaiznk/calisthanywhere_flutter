import 'package:calistenico/src/models/exercise_model.dart';
import 'package:calistenico/src/models/routine_model.dart';

class DatosRout {
  late Routine rutina;
  late int numSerDef, numSerTemp, numEjer;

  DatosRout(Routine rutina, int numSerDef, int numSerTemp, int numEjer) {
    this.rutina = rutina;
    this.numSerDef = numSerDef;
    this.numSerTemp = numSerTemp;
    this.numEjer = numEjer;
  }
}

class DataNewRout {
  late List<Exercise> nuevaList;
  late Routine rutina;
  late List<int> positionList;
  late int iteradorEjer;

  DataNewRout(Routine rutina, List<Exercise> nuevaList, List<int> positionList,
      int iteradorEjer) {
    this.rutina = rutina;
    this.nuevaList = nuevaList;
    this.positionList = positionList;
    this.iteradorEjer = iteradorEjer;
  }
}
