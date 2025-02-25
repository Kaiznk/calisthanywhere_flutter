import 'package:calistenico/src/databases/exercisesDB.dart';
import 'package:flutter/material.dart';
import 'package:calistenico/src/models/exercise_model.dart';

class SueloPage extends StatelessWidget {
  final ExercisesDB db = ExercisesDB(); // Instancia de la base de datos local

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalisthAnyWhere'),
      ),
      body: FutureBuilder<List<Exercise>>(
        future: _loadExercises(),
        builder: (context, AsyncSnapshot<List<Exercise>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No exercises found.'));
          }

          final exercises = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.all(12.0),
            itemCount: exercises.length,
            itemBuilder: (context, i) => _cargarCards(context, exercises[i]),
          );
        },
      ),
    );
  }

  Future<List<Exercise>> _loadExercises() async {
    return Future.delayed(Duration(milliseconds: 500), () => db.getSuelo());
  }

  Widget _cargarCards(BuildContext context, Exercise exercise) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: exercise);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Column(
            children: <Widget>[
              FadeInImage(
                placeholder: AssetImage('assets/images/jar_loading.gif'),
                height: 200.0,
                fit: BoxFit.contain,
                image: AssetImage('assets/images/${exercise.foto}.png'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/default_image.png',
                      height: 200.0, fit: BoxFit.contain);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Text(
                      exercise.nombre,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      exercise.nivel,
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
