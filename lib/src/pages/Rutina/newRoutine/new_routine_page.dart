import 'package:calistenico/src/databases/exercisesDB.dart';
import 'package:calistenico/src/models/datos_rout.dart';
import 'package:calistenico/src/models/exercise_model.dart';
import 'package:calistenico/src/models/routine_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewRoutine extends StatefulWidget {
  @override
  _NewRoutineState createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
  String nombreRout = '';
  int noMinSerie = -1;
  int noMaxSerie = -1;
  int segundEjer = -1;
  int segundSeries = -1;
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerMinSerie = TextEditingController();
  TextEditingController controllerMaxSerie = TextEditingController();
  TextEditingController controllerSegunEjer = TextEditingController();
  TextEditingController controllerSegundSerie = TextEditingController();

  List<Exercise> _listExerc = [];
  List<Exercise> _finalList = [];
  List<int> _reptsEjer = [];
  List<int> _isSelected = [];
  Color colorcard = Color(0xAAAAAAAA);
  Color colorCardSecund = Color(0xDDDAAFFF);
  late DataNewRout _dataNewRout;

  List<Exercise> _kL = [];

  final ExercisesDB _exercisesDB = new ExercisesDB();

  @override
  void dispose() {
    controllerNombre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listExerc = crearLista();
    _cargarDatosinSelected();
    return Scaffold(
      appBar: AppBar(
        title: Text('New Routine'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controllerNombre,
              decoration: InputDecoration(labelText: 'Routine name'),
              onChanged: (value) {
                nombreRout = controllerNombre.text;
              },
            ),
            SizedBox(
              height: 1.0,
            ),
            Row(
              children: [
                Container(
                  width: 122.0,
                  height: 60.0,
                  child: TextField(
                    controller: controllerMinSerie,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(helperText: 'Minimum Serial No.'),
                    onChanged: (value) {
                      if (controllerMinSerie.text == '' ||
                          controllerMinSerie.text == '.')
                        noMinSerie = -1;
                      else
                        noMinSerie = int.parse(controllerMinSerie.text);
                    },
                  ),
                ),
                SizedBox(
                  width: 100.0,
                ),
                Flexible(
                  child: Container(
                    width: 122.0,
                    height: 60.0,
                    child: TextField(
                      controller: controllerMaxSerie,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(helperText: 'Maximum Sets No.'),
                      onChanged: (value) {
                        if (controllerMaxSerie.text == '' ||
                            controllerMaxSerie.text == '.')
                          noMaxSerie = -1;
                        else
                          noMaxSerie = int.parse(controllerMaxSerie.text);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.0,
            ),
            Row(
              children: [
                Container(
                  width: 132.0,
                  height: 60.0,
                  child: TextField(
                    controller: controllerSegunEjer,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(helperText: 'Seconds btw exercises'),
                    onChanged: (value) {
                      if (controllerSegunEjer.text == '' ||
                          controllerSegunEjer.text == '.')
                        segundEjer = -1;
                      else
                        segundEjer = int.parse(controllerSegunEjer.text);
                    },
                  ),
                ),
                SizedBox(
                  width: 91.0,
                ),
                Flexible(
                  child: Container(
                    width: 122.0,
                    height: 60.0,
                    child: TextField(
                      controller: controllerSegundSerie,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(helperText: 'Seconds btw sets'),
                      onChanged: (value) {
                        if (controllerSegundSerie.text == '' ||
                            controllerSegundSerie.text == '.')
                          segundSeries = -1;
                        else
                          segundSeries = int.parse(controllerSegundSerie.text);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 26.0),
                child: Text(
                  'Choose from the following exercises',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
            Expanded(
                flex: 5,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.0),
                    margin: EdgeInsets.symmetric(vertical: 3.0),
                    // height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      itemCount: _listExerc.length,
                      itemBuilder: (context, i) =>
                          _cargarCards(context, _listExerc[i], i),
                    ))),
            Expanded(
              flex: 1,
              child: Container(
                  width: 440.0,
                  height: 1,
                  margin: EdgeInsets.all(6.0),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: const Color(0xFF0E0E0E),
                    textColor: const Color(0xFFE0E0E6),
                    onPressed: () {
                      _finalList = [];
                      for (int i = 0; i < _isSelected.length; i++) {
                        if (_isSelected[i] == 1) _finalList.add(_listExerc[i]);
                      }
                      if (nombreRout == '' ||
                          noMinSerie == -1 ||
                          noMaxSerie == -1 ||
                          segundEjer == -1 ||
                          segundSeries == -1) {
                        Fluttertoast.showToast(
                            msg: 'Missing items to choose.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (noMinSerie == 0 ||
                          noMaxSerie == 0 ||
                          segundEjer == 0 ||
                          segundSeries == 0) {
                        Fluttertoast.showToast(
                            msg:
                                'The minimum and maximum number of rounds, and the seconds between exercises and rounds cannot be 0.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 4,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (noMinSerie > noMaxSerie) {
                        Fluttertoast.showToast(
                            msg:
                                'The maximum number of rounds must be greater than the minimum number of rounds.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (_finalList.length == 0) {
                        Fluttertoast.showToast(
                            msg: 'You must choose at least 1 exercise.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        _inicializarReptsEjer();

                        _inicializarListExer();

                        Routine _rutina = new Routine(
                            -99,
                            nombreRout,
                            noMaxSerie,
                            noMinSerie,
                            segundEjer,
                            segundSeries,
                            _kL,
                            _reptsEjer,
                            'img_kaizen',
                            'User Routine');

                        _dataNewRout = new DataNewRout(
                            _rutina, _finalList, _listaVerificar(), 0);
                        Navigator.pushReplacementNamed(context, 'exercnewrout',
                            arguments: _dataNewRout);
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 19.0),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _cargarDatosinSelected() {
    for (int i = 0; i < _listExerc.length; i++) {
      _isSelected.add(0);
    }
  }

  List<Exercise> crearLista() {
    List<Exercise> list = [];

    list = _exercisesDB.getAll();
    return list;
  }

  Widget _cargarCards(BuildContext context, Exercise ejercR, int i) {
    return InkWell(
      onTap: () {
        if (_isSelected[i] == 0) {
          _isSelected[i] = 1;
          setState(() {
            colorcard = Color(0xAAAAAAAA);
          });
        } else if (_isSelected[i] == 1) {
          _isSelected[i] = 0;
          setState(() {
            colorCardSecund = Color(0xDDDAAFFF);
          });
        }
      },
      child: Card(
          color: _colorCard(i),
          margin: EdgeInsets.all(11.0),
          child: ListTile(
            leading: Image(
              image: AssetImage('assets/images/' + ejercR.foto + '.png'),
              height: 50.0,
              width: 50.0,
            ),
            title: Text(
              ejercR.nombre,
              style: TextStyle(fontSize: 14.0),
            ),
          )),
    );
  }

  Color _colorCard(int i) {
    if (_isSelected[i] == 0)
      return colorcard;
    else if (_isSelected[i] == 1) return colorCardSecund;

    return colorcard;
  }

  List<int> _listaVerificar() {
    List<int> a = [];
    for (int i = 0; i < _finalList.length; i++) {
      a.add(-2);
    }
    return a;
  }

  void _inicializarReptsEjer() {
    for (int i = 0; i < _finalList.length; i++) {
      _reptsEjer.add(0);
    }
  }

  void _inicializarListExer() {
    for (int i = 0; i < _finalList.length; i++) {
      _kL.add(new Exercise('nombre', 'nivel', 'muscle', 'previos', 'ayudaA',
          'descripcion', 'consejo', 'foto'));
    }
  }
}
