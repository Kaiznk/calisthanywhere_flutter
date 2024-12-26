import 'package:calistenico/src/models/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Inicializamos Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadExercisesFromFirestore();
  }

  @override
  void dispose() {
    controllerNombre.dispose();
    super.dispose();
  }

  Future<void> _loadExercisesFromFirestore() async {
    List<Exercise> exerciseList = [];
    try {
      final querySnapshot = await _firestore.collection('exercises').get();
      for (var doc in querySnapshot.docs) {
        exerciseList.add(Exercise.fromMap(doc.data()));
      }
      setState(() {
        _listExerc = exerciseList;
        _cargarDatosinSelected();
      });
    } catch (e) {
      print('Error fetching exercises: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 1.0),
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
                      noMinSerie = controllerMinSerie.text.isEmpty
                          ? -1
                          : int.parse(controllerMinSerie.text);
                    },
                  ),
                ),
                SizedBox(width: 100.0),
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
                        noMaxSerie = controllerMaxSerie.text.isEmpty
                            ? -1
                            : int.parse(controllerMaxSerie.text);
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
                      segundEjer = controllerSegunEjer.text.isEmpty
                          ? -1
                          : int.parse(controllerSegunEjer.text);
                    },
                  ),
                ),
                SizedBox(width: 91.0),
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
                        segundSeries = controllerSegundSerie.text.isEmpty
                            ? -1
                            : int.parse(controllerSegundSerie.text);
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
                  margin: EdgeInsets.all(6.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFFE0E0E6),
                      backgroundColor: const Color(0xFF0E0E0E),
                    ),
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
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (noMinSerie == 0 ||
                          noMaxSerie == 0 ||
                          segundEjer == 0 ||
                          segundSeries == 0) {
                        Fluttertoast.showToast(
                            msg: 'Values cannot be 0.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (noMinSerie > noMaxSerie) {
                        Fluttertoast.showToast(
                            msg: 'Max rounds must be greater than min rounds.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (_finalList.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Choose at least 1 exercise.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        _inicializarReptsEjer();
                        _inicializarListExer();
                        Routine _rutina = Routine(
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
                        _dataNewRout = DataNewRout(
                            _rutina, _finalList, _listaVerificar(), 0);
                        Navigator.pushReplacementNamed(context, 'exercnewrout',
                            arguments: _dataNewRout);
                      }
                    },
                    child: Text('Next', style: TextStyle(fontSize: 19.0)),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _cargarDatosinSelected() {
    _isSelected = List.generate(_listExerc.length, (_) => 0);
  }

  Widget _cargarCards(BuildContext context, Exercise ejercR, int i) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected[i] = _isSelected[i] == 0 ? 1 : 0;
        });
      },
      child: Card(
        color: _isSelected[i] == 0 ? colorcard : colorCardSecund,
        margin: EdgeInsets.all(11.0),
        child: ListTile(
          leading: Image.asset('assets/images/${ejercR.foto}.png',
              height: 50.0, width: 50.0),
          title: Text(ejercR.nombre, style: TextStyle(fontSize: 14.0)),
        ),
      ),
    );
  }

  List<int> _listaVerificar() {
    return List.filled(_finalList.length, 0);
  }

  void _inicializarReptsEjer() {
    _reptsEjer = List.filled(_finalList.length, 1);
  }

  void _inicializarListExer() {
    _kL = List.from(_finalList);
  }
}

class Routine {
  int id;
  String nombre;
  int noMaxSerie;
  int noMinSerie;
  int segundEjer;
  int segundSeries;
  List<Exercise> kL;
  List<int> reptsEjer;
  String img;
  String tipo;

  Routine(
      this.id,
      this.nombre,
      this.noMaxSerie,
      this.noMinSerie,
      this.segundEjer,
      this.segundSeries,
      this.kL,
      this.reptsEjer,
      this.img,
      this.tipo);
}

class DataNewRout {
  final Routine rutina;
  final List<Exercise> finalList;
  final List<int> listaVerificar;
  final int unknownInt;

  DataNewRout(
      this.rutina, this.finalList, this.listaVerificar, this.unknownInt);
}
