import 'package:calistenico/src/models/datos_rout.dart';
import 'package:calistenico/src/models/exercise_model.dart';
import 'package:calistenico/src/models/routine_model.dart';
import 'package:calistenico/src/pages/Rutina/newRoutine/db/sql_helpExer.dart';
import 'package:calistenico/src/pages/Rutina/newRoutine/db/sql_helper.dart';
import 'package:flutter/material.dart';

class RoutineInitialPage extends StatefulWidget {
  @override
  _RoutineInitialPageState createState() => _RoutineInitialPageState();
}

class _RoutineInitialPageState extends State<RoutineInitialPage> {
  late Routine _routine;
  int numSerDef = 0;
  late String _opcionSeleccionada = '1';
  bool t = false;

  @override
  Widget build(BuildContext context) {
    _routine = ModalRoute.of(context)?.settings.arguments as Routine;
    if (t == false) {
      int o = _routine.serieMin;
      _opcionSeleccionada = '$o';
      t = true;
    }

    return Scaffold(
      appBar:
          AppBar(title: Text('CalisthAnyWhere'), actions: isUserR(_routine)),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              _routine.nombRout,
              style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
            ),
          ),
          Container(
              width: 440.0,
              margin: EdgeInsets.all(7.0),
              // ignore: deprecated_member_use
              child: RaisedButton(
                color: const Color(0xFF0E0E0E),
                textColor: const Color(0xFFE0E0E6),
                onPressed: () {
                  //Navigator.pushNamed(context, 'ejerroutpage');
                  Navigator.pushReplacementNamed(context, 'ejerroutpage',
                      arguments: _enviarDatos());
                },
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 19.0),
                ),
              )),
          Container(
            margin: EdgeInsets.only(left: 9.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Number of rounds  ',
                ),
                _crearDropdown(_routine.serieMin, _routine.serieMax),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: _routine.ejercR.length,
              itemBuilder: (context, i) =>
                  _cargarCards(context, _routine.ejercR[i], _routine.repet[i]),
            ),
          )
        ],
      ),
    );
  }

  Widget _cargarCards(BuildContext context, Exercise ejercR, int a) {
    return Card(
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
          trailing: Text('Reps: ' + repets(a)),
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  String repets(int a) {
    int k;
    if (a == 9999) {
      return "Max";
    } else if (a < 0) {
      k = a * (-1);
      return '$k';
    } else if (a > 10000) {
      k = a - 10000;
      return '$k';
    } else {
      return '$a';
    }
  }

  Widget _crearDropdown(int min, int max) {
    List<DropdownMenuItem<String>> listser = [];
    for (int i = min; i <= max; i++) {
      listser.add(DropdownMenuItem(
        child: Text('$i'),
        value: '$i',
      ));
    }

    return DropdownButton(
      value: _opcionSeleccionada,
      items: listser,
      onChanged: (opt) {
        setState(() {
          _opcionSeleccionada = '$opt';
        });
      },
    );
  }

  DatosRout _enviarDatos() => DatosRout(_routine, _numSer(), 1, 0);

  int _numSer() {
    int a = 0;
    for (int i = 1; i <= 7; i++) {
      if (_opcionSeleccionada == '$i') {
        return i;
      }
    }
    return a;
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    await SQLHelpExer.deleteItemRout(id);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Success removing routine.'),
    ));
  }

  isUserR(Routine _routine) {
    if (_routine.foto == 'training') {
      return <Widget>[
        IconButton(
            color: Colors.red,
            icon: Icon(Icons.delete),
            onPressed: () {
              _deleteItem(_routine.id);
              Navigator.pushNamedAndRemoveUntil(
                  context, 'home', ModalRoute.withName('/'));
            })
      ];
    }
    return <Widget>[
      SizedBox(
        width: 1.0,
      )
    ];
  }
}
