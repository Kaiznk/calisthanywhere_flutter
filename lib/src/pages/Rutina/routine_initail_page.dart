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
  late String _opcionSeleccionada;

  @override
  void initState() {
    super.initState();
    _opcionSeleccionada = ""; // Inicialización temprana
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! Routine) {
      return _errorScreen();
    }

    _routine = args;
    _opcionSeleccionada = _opcionSeleccionada.isEmpty
        ? '${_routine.serieMin}'
        : _opcionSeleccionada;

    List<Exercise> exerciseList = _routine.ejercR.cast<Exercise>();

    return Scaffold(
      appBar: AppBar(
        title: Text('CalisthAnyWhere'),
        actions: isUserR(_routine),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Center(
              child: Text(
                _routine.nombRout,
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Texto en negrita para resaltar
                  fontSize: 34.0, // Tamaño grande y llamativo
                  color: Colors.deepPurple, // Color fuerte y elegante
                  fontStyle: FontStyle.normal, // Sin cursiva
                  letterSpacing: 1.5, // Espaciado ligero entre letras
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0), // Sombra sutil
                      blurRadius: 4.0,
                      color: Colors.black38, // Sombra suave para destacar
                    ),
                  ],
                  height: 1.2, // Altura entre líneas para un mejor aspecto
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Theme.of(context).secondaryHeaderColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'ejerroutpage',
                      arguments: _enviarDatos());
                },
                child: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 20.0, // Tamaño más grande
                    fontWeight: FontWeight.bold, // Negrita para destacar
                    color: Colors.white, // Texto blanco para contraste
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0), // Sombra ligera
                        blurRadius: 3.0,
                        color: Colors.black45, // Sombra sutil
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 9.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Number of rounds:',
                  ),
                  SizedBox(width: 10.0),
                  _crearDropdown(_routine.serieMin, _routine.serieMax),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: exerciseList.length,
                itemBuilder: (context, i) {
                  final exercise = exerciseList[i];
                  return _cargarCards(context, exercise, _routine.repet[i]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _errorScreen() {
    return Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(
        child: Text(
          'No se pudo cargar la rutina.',
        ),
      ),
    );
  }

  Widget _cargarCards(BuildContext context, Exercise ejercR, int a) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: _buildImage(ejercR.foto),
        ),
        title: Text(
          ejercR.nombre,
        ),
        trailing: Text(
          'Reps: ${repets(a)}',
        ),
      ),
    );
  }

  Widget _buildImage(String foto) {
    // Verificar si es una URL
    final uri = Uri.tryParse(foto);
    final isUrl = uri != null && uri.hasAbsolutePath;

    if (isUrl) {
      return Image.network(
        foto,
        height: 50.0,
        width: 50.0,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.image_not_supported, size: 50.0),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
    } else {
      return Image.asset(
        'assets/images/$foto.png',
        height: 50.0,
        width: 50.0,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.image_not_supported, size: 50.0),
      );
    }
  }

  String repets(int a) {
    if (a == 9999) return "Max";
    if (a < 0) return '${-a}';
    if (a > 10000) return '${a - 10000}';
    return '$a';
  }

  Widget _crearDropdown(int min, int max) {
    List<DropdownMenuItem<String>> listser = [];
    for (int i = min; i <= max; i++) {
      listser.add(DropdownMenuItem(
        child: Text(
          '$i',
        ),
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
      dropdownColor: Theme.of(context).canvasColor,
    );
  }

  DatosRout _enviarDatos() => DatosRout(_routine, _numSer(), 1, 0);

  int _numSer() {
    return int.tryParse(_opcionSeleccionada) ?? _routine.serieMin;
  }

  void _deleteItem(int id) async {
    try {
      await SQLHelper.deleteItem(id);
      await SQLHelpExer.deleteItemRout(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Success removing routine.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error removing routine: $e')),
      );
    }
  }

  List<Widget> isUserR(Routine _routine) {
    if (_routine.foto == 'training') {
      return <Widget>[
        IconButton(
          color: Colors.red,
          icon: Icon(Icons.delete),
          onPressed: () {
            _deleteItem(_routine.id);
            Navigator.pushNamedAndRemoveUntil(
                context, 'home', ModalRoute.withName('/'));
          },
        ),
      ];
    }
    return <Widget>[SizedBox(width: 1.0)];
  }
}
