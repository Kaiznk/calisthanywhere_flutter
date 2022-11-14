import 'package:calistenico/src/databases/routinesDB.dart';
import 'package:calistenico/src/models/exercise_model.dart';
import 'package:calistenico/src/models/routine_model.dart';
import 'package:calistenico/src/pages/Rutina/newRoutine/db/sql_helpExer.dart';
import 'package:calistenico/src/pages/Rutina/newRoutine/db/sql_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RutinasNavigPage extends StatefulWidget {
  @override
  State<RutinasNavigPage> createState() => _RutinasNavigPageState();
}

class _RutinasNavigPageState extends State<RutinasNavigPage> {
  final RoutinesDB routinesDB = new RoutinesDB();

  List<Routine> listaRout = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _crearLista(); // Loading the diary when the app starts
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Scaffold(
              body: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20.0, crossAxisCount: 2),
                itemCount: listaRout.length,
                itemBuilder: (context, i) =>
                    _cargarCards(context, listaRout[i]),
              ),
            ),
          );
  }

  Widget _cargarCards(BuildContext context, Routine routine) {
    final card = Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 3.0,
          ),
          Text(
            routine.tipoR,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 3.0),
            child: FadeInImage(
                placeholder: AssetImage('assets/images/jar_loading.gif'),
                height: 119.0,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/' + routine.foto + '.png')),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                routine.nombRout,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
    return InkWell(
      onTap: () {
        if (routine.nombRout == 'New Routine') {
          Navigator.pushNamed(context, 'newroutine');
        } else {
          Navigator.pushNamed(context, 'routine_initial', arguments: routine);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: colorCards(routine),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 10.0))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: card,
        ),
      ),
    );
  }

  void _crearLista() async {
    final dataRout = await SQLHelper.getItems();
    final dataEjer = await SQLHelpExer.getItems();
    int k = 0;
    int l = 0;
    List<int> repet = [];
    List<Exercise> ejerR = [];

    for (int i = 0; i < routinesDB.getRutinas().length; i++) {
      listaRout.add(routinesDB.getRutinas()[i]);
    }

    if (dataRout.isNotEmpty) {
      while (k < dataRout.length) {
        l = 0;
        ejerR = [];
        repet = [];
        while (l < dataEjer.length) {
          if (dataEjer[l]['idRoutine'] == dataRout[k]['id']) {
            ejerR.add(new Exercise(
                dataEjer[l]['nombre'],
                dataEjer[l]['nivel'],
                dataEjer[l]['muscle'],
                dataEjer[l]['previos'],
                dataEjer[l]['ayudaA'],
                dataEjer[l]['descripcion'],
                dataEjer[l]['consejo'],
                dataEjer[l]['foto']));
            repet.add(dataEjer[l]['repet']);
          }
          l++;
        }
        listaRout.add(new Routine(
            dataRout[k]['id'],
            dataRout[k]['nombRout'],
            dataRout[k]['serieMax'],
            dataRout[k]['serieMin'],
            dataRout[k]['descanEjerc'],
            dataRout[k]['descanSerie'],
            ejerR,
            repet,
            'training',
            dataRout[k]['tipoR']));
        k++;
      }
    }

    listaRout.add(new Routine(-199, 'New Routine', 1, 1, 1, 1, [], [],
        'ic_add_black_24dp', 'User routine'));

    setState(() {
      _isLoading = false;
    });
  }

  Color colorCards(Routine routine) {
    if (routine.tipoR == "Initiation routine") {
      return Color(0xFF7B37DF);
    } else if (routine.tipoR == "Movement progressions") {
      return Color(0xFF42AB97);
    } else if (routine.tipoR == "General routine") {
      return Color(0xFF003BEC);
    } else if (routine.tipoR == "User Routine") {
      return Colors.amber;
    }
    return Color(0xFFE43010);
  }
}
