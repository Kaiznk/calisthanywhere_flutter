import 'package:calistenico/src/models/routine_T.dart';
import 'package:flutter/material.dart';
import 'package:calistenico/src/services/backendless_service.dart';

class WorkoutDetailPage extends StatefulWidget {
  final String workoutId;

  WorkoutDetailPage({required this.workoutId});

  @override
  _WorkoutDetailPageState createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  late Future<RoutineT?> _routineFuture;
  final BackendlessService _backendlessService = BackendlessService();

  @override
  void initState() {
    super.initState();
    _routineFuture =
        _backendlessService.fetchRoutineWithExercises(widget.workoutId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout Details",
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<RoutineT?>(
        future: _routineFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator(color: Colors.deepPurpleAccent));
          } else if (snapshot.hasError || !snapshot.hasData) {
            return Center(
                child: Text('Error loading workout.',
                    style: TextStyle(fontSize: 18, color: Colors.redAccent)));
          }

          final routine = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 📌 Título de la rutina con ícono
                Row(
                  children: [
                    Icon(Icons.fitness_center,
                        color: Colors.deepPurpleAccent, size: 28),
                    SizedBox(width: 10),
                    Text(
                      routine.nombRout,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // 📌 Sección de ejercicios
                Expanded(
                  child: routine.ejercR.isNotEmpty
                      ? ListView.builder(
                          itemCount: routine.ejercR.length,
                          itemBuilder: (context, index) {
                            final exercise = routine.ejercR[index];
                            return Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                leading: Icon(Icons.sports_gymnastics,
                                    color: Colors.deepPurpleAccent),
                                title: Text(
                                  exercise.nombre,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                    "Reps: ${routine.repet[index]} | Sets: ${exercise.serie}"),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    size: 18, color: Colors.grey),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "No exercises found",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                ),

                SizedBox(height: 20),

                // 📌 Botón para comenzar el entrenamiento
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'ejertraining',
                        arguments: routine,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'Start Workout',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
