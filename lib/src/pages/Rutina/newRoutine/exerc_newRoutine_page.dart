import 'package:calistenico/src/models/datos_rout.dart';
import 'package:calistenico/src/models/exercise_model.dart';
import 'package:calistenico/src/pages/Rutina/newRoutine/db/sql_helpExer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:calistenico/src/pages/Rutina/newRoutine/db/sql_helper.dart';

class ExercNewRoutine extends StatefulWidget {
  @override
  _ExercNewRoutineState createState() => _ExercNewRoutineState();
}

class _ExercNewRoutineState extends State<ExercNewRoutine> {
  late DataNewRout _dataNewRout;
  late DataNewRout _dataNewRout2;
  int iterador = 0;

  int cantRepets = -1;
  int numEjerSerie = -1;
  int numA = -1;
  int multSec = 0;
  List<Exercise> _pasarlist = [];
  TextEditingController controllerCantRepets = TextEditingController();
  TextEditingController controllerNumEjerSerie = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != Null) {
      _dataNewRout = ModalRoute.of(context)?.settings.arguments as DataNewRout;
    }

    for (int i = 0; i < _dataNewRout.nuevaList.length; i++) {
      _pasarlist.add(_dataNewRout.nuevaList[i]);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('New Routine'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 222.0,
            margin: EdgeInsets.only(bottom: 7.0),
            child: Image(
                image: AssetImage('assets/images/' +
                    _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].foto +
                    '.png')),
          ),
          Text(
            _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'sain-serif'),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                width: 180.0,
                child: TextField(
                  controller: controllerCantRepets,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      helperText: 'Amount of ' + checkExer(),
                      labelText: checkExer()),
                  onChanged: (value) {
                    if (controllerCantRepets.text == '')
                      cantRepets = -1;
                    else
                      cantRepets = int.parse(controllerCantRepets.text);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                width: 210.0,
                child: TextField(
                  controller: controllerNumEjerSerie,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      helperText: 'Number of the exercise in the round',
                      labelText: 'Number'),
                  onChanged: (value) {
                    if (controllerNumEjerSerie.text == '' ||
                        controllerNumEjerSerie.text == '.')
                      numEjerSerie = -1;
                    else
                      numEjerSerie = int.parse(controllerNumEjerSerie.text);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 440.0,
            margin: EdgeInsets.symmetric(horizontal: 7.0),
            // ignore: deprecated_member_use
            child: RaisedButton(
              color: const Color(0xFF0E0E0E),
              textColor: const Color(0xFFE0E0E6),
              onPressed: () async {
                if (cantRepets == -1 || numEjerSerie == -1) {
                  Fluttertoast.showToast(
                      msg: 'Missing items to choose.',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (cantRepets < 1) {
                  Fluttertoast.showToast(
                      msg: 'Invalid number in the number of repetitions.',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (numEjerSerie < 1) {
                  Fluttertoast.showToast(
                      msg: 'Invalid number at exercise position in list.',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (numEjerSerie > _dataNewRout.nuevaList.length) {
                  int h = _dataNewRout.nuevaList.length;
                  Fluttertoast.showToast(
                      msg:
                          'Invalid number at exercise position in round. The round has $h exercises.',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (_yaPuesto()) {
                  Fluttertoast.showToast(
                      msg:
                          'You already placed an exercise on that number in the round.',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else {
                  _colocarPosition();
                  numA = numEjerSerie - 1;
                  _cambiarRepsExer();
                  _cambiarPosExer();

                  if (_dataNewRout.iteradorEjer <
                      _dataNewRout.rutina.ejercR.length - 1) {
                    _dataNewRout.iteradorEjer++;
                    //_dataNewRout.nuevaList = _pasarlist;
                    _dataNewRout2 = new DataNewRout(
                        _dataNewRout.rutina,
                        _pasarlist,
                        _dataNewRout.positionList,
                        _dataNewRout.iteradorEjer);
                    Navigator.pushReplacementNamed(context, 'exercnewrout2',
                        arguments: _dataNewRout2);
                  } else {
                    await _addItem();
                  }
                }
              },
              child: Text(
                'Next',
                style: TextStyle(fontSize: 19.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //metodo que dice si en la posicion ya se encuetra un ejercicio colocado
  bool _yaPuesto() {
    if (_dataNewRout.positionList[numEjerSerie - 1] != -2) return true;

    return false;
  }

  //guardar que hay un ejercicio colocado en determinada posicion
  void _colocarPosition() {
    if (_dataNewRout.positionList[numEjerSerie - 1] == 0) {
      _dataNewRout.positionList[numEjerSerie - 1] = numEjerSerie - 1;
    }
  }

  void _cambiarRepsExer() {
    _dataNewRout.rutina.repet[numA] = cantRepets + multSec;
  }

  void _cambiarPosExer() {
    _dataNewRout.rutina.ejercR[numA] =
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer];
  }

  // Insert a new journal to the database
  Future<void> _addItem() async {
    int idR = -777;
    idR = await SQLHelper.createItem(
        _dataNewRout.rutina.nombRout,
        _dataNewRout.rutina.serieMax,
        _dataNewRout.rutina.serieMin,
        _dataNewRout.rutina.descanEjerc,
        _dataNewRout.rutina.descanSerie,
        'training',
        'User Routine');
    await _addItemExer(idR);
    Navigator.pushNamedAndRemoveUntil(
        context, 'home', ModalRoute.withName('/'));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Success creating routine.'),
    ));
  }

  Future<void> _addItemExer(int idR) async {
    for (int i = 0; i < _dataNewRout.rutina.ejercR.length; i++) {
      await SQLHelpExer.createItem(
          _dataNewRout.rutina.ejercR[i].nombre,
          _dataNewRout.rutina.ejercR[i].nivel,
          _dataNewRout.rutina.ejercR[i].muscle,
          _dataNewRout.rutina.ejercR[i].previos,
          _dataNewRout.rutina.ejercR[i].ayudaA,
          _dataNewRout.rutina.ejercR[i].descripcion,
          _dataNewRout.rutina.ejercR[i].consejo,
          _dataNewRout.rutina.ejercR[i].foto,
          _dataNewRout.rutina.repet[i],
          idR);
    }
  }

  String checkExer() {
    if (_dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Wall sit" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre == "Sprint" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Skipping in site" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre == "Plank" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Side Plank" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "The Hollow" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Handstand" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Frog stand" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Tucked Planche" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Straddle Planche" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Full Planche" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Dip bar L-Sit Hold" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Handstand on bar" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Tucked Human Flag" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Tucked Front Lever" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Back Lever" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Human Flag" ||
        _dataNewRout.nuevaList[_dataNewRout.iteradorEjer].nombre ==
            "Front Lever") {
      multSec = 10000;
      return 'Seconds';
    }
    return 'Repetitions';
  }
}

//prueba