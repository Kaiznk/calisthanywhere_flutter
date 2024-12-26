import 'dart:async';
import 'package:flutter/material.dart';
import 'package:calistenico/src/models/datos_rout.dart'; // Importamos DatosRout

// Simulación de datos que normalmente se cargarían desde una base de datos en la nube
Future<List<Map<String, dynamic>>> fetchExercises(String workoutId) async {
  // Simulates fetching data from a cloud database
  await Future.delayed(Duration(seconds: 2)); // Simulate a network delay
  return [
    {
      'name': 'Push-ups',
      'reps': 15,
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Squats',
      'reps': 20,
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Lunges',
      'reps': 12,
      'imageUrl': 'https://via.placeholder.com/150',
    },
  ];
}

class WorkoutDetailPage extends StatefulWidget {
  final DatosRout datosRutina; // Usamos la clase DatosRout importada

  WorkoutDetailPage({required this.datosRutina});

  @override
  _WorkoutDetailPageState createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  late Future<List<Map<String, dynamic>>> _exercisesFuture;

  @override
  void initState() {
    super.initState();
    _exercisesFuture = fetchExercises(widget.datosRutina.rutina.nombRout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.datosRutina.rutina.nombRout),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercises',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _exercisesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error loading exercises.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No exercises available.'));
                  } else {
                    final exercises = snapshot.data!;
                    return ListView.builder(
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = exercises[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Image.network(
                              exercise['imageUrl'],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(exercise['name']),
                            trailing: Text('Reps: ${exercise['reps']}'),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'ejerRoutPage',
                  arguments: widget.datosRutina,
                );
              },
              child: Text('Start Workout'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
