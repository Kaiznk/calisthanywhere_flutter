import 'package:calistenico/src/models/routine_model.dart';
import 'package:flutter/material.dart';
import 'package:calistenico/src/databases/routinesDB.dart'; // Asegúrate de importar el archivo correcto

// ignore: must_be_immutable
class RutinasNavigPage extends StatefulWidget {
  @override
  State<RutinasNavigPage> createState() => _RutinasNavigPageState();
}

class _RutinasNavigPageState extends State<RutinasNavigPage> {
  List<Routine> listaRout = [];
  bool _isLoading = true;
  RoutinesDB routinesDB = new RoutinesDB();

  @override
  void initState() {
    super.initState();
    _crearLista(); // Cargar las rutinas desde la base de datos local cuando inicie la página
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
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final card = Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 3.0,
          ),
          Text(
            routine.tipoR,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  isDarkMode ? Colors.white : Colors.black, // Cambia el color
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 3.0),
            child: FadeInImage(
                placeholder: AssetImage('assets/images/jar_loading.gif'),
                height: 119.0,
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/' + routine.foto + '.png')),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                routine.nombRout,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black, // Color dinámico
                ),
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

  void _crearLista() {
    try {
      // Obtener rutinas desde la base de datos local
      List<Routine> loadedRoutines = routinesDB.getRutinas();

      // Agregar una rutina de ejemplo para nuevos usuarios
      loadedRoutines.add(Routine(
        -100, // ID ficticio
        'New Routine',
        1,
        1,
        1,
        1,
        [],
        [],
        'ic_add_black_24dp',
        'User routine',
      ));

      // Actualizar el estado de la lista de rutinas
      setState(() {
        listaRout = loadedRoutines;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading routines: $e');
      setState(() {
        _isLoading = false;
      });
    }
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
