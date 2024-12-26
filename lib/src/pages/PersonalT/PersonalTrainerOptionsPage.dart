import 'package:calistenico/src/models/routine_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class PersonalTrainerOptionsPage extends StatefulWidget {
  final String userId;

  PersonalTrainerOptionsPage({required this.userId});

  @override
  _PersonalTrainerOptionsPageState createState() =>
      _PersonalTrainerOptionsPageState();
}

class _PersonalTrainerOptionsPageState
    extends State<PersonalTrainerOptionsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Routine>> _fetchClientWorkouts() {
    return _firestore
        .collection('routinesClient')
        .where('userId', isEqualTo: widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Routine.fromMap(
                {"id": doc.id, ...doc.data() as Map<String, dynamic>}))
            .toList());
  }

  Stream<List<Map<String, dynamic>>> _fetchTasks() {
    return _firestore
        .collection('tasks')
        .where('clientId', isEqualTo: widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => {"id": doc.id, ...doc.data() as Map<String, dynamic>})
            .toList());
  }

  // Método para obtener el nombre de usuario del cliente
  Future<String> _fetchUsername() async {
    try {
      DocumentSnapshot userDoc = await _firestore
          .collection('users') // Aquí asumo que tienes una colección 'users'
          .doc(widget.userId)
          .get();

      if (userDoc.exists) {
        return userDoc['username'] ??
            'Client'; // Devuelve el username si existe
      } else {
        return 'Client'; // Valor por defecto si no se encuentra el usuario
      }
    } catch (e) {
      return 'Client'; // En caso de error, devolver 'Client'
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String>(
          future: _fetchUsername(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            }
            if (snapshot.hasError) {
              return const Text("Error loading username");
            }
            return Text("Welcome, ${snapshot.data ?? 'Client'}!");
          },
        ),
        centerTitle: true,
        backgroundColor: theme.primaryColor,
        elevation: 5.0,
      ),
      body: Container(
        color: theme.scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildWelcomeBanner(),
              const SizedBox(height: 16),
              _buildSectionTitle("Upcoming Workouts"),
              StreamBuilder<List<Routine>>(
                stream: _fetchClientWorkouts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                        child:
                            Text("Error loading workouts: ${snapshot.error}"));
                  }
                  List<Routine> workouts = snapshot.data ?? [];

                  if (workouts.isEmpty) {
                    return const Center(child: Text("No workouts available."));
                  }

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: workouts.length,
                      itemBuilder: (context, index) {
                        Routine routine = workouts[index];
                        return Card(
                          color: theme.cardColor,
                          child: ListTile(
                            leading: Icon(Icons.fitness_center,
                                color: theme.iconTheme.color),
                            title: Text(routine.nombRout,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(
                              "Type: ${routine.tipoR}",
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                'routine_initial',
                                arguments: routine,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildSectionTitle("Tasks"),
              StreamBuilder<List<Map<String, dynamic>>>(
                stream: _fetchTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                        child: Text("Error loading tasks: ${snapshot.error}"));
                  }
                  List<Map<String, dynamic>> tasks = snapshot.data ?? [];

                  if (tasks.isEmpty) {
                    return const Center(child: Text("No tasks available."));
                  }

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> task = tasks[index];
                        String formattedDate = task['createdAt'] != null
                            ? DateFormat.yMMMd().add_jm().format(
                                  (task['createdAt'] as Timestamp).toDate(),
                                )
                            : 'Unknown date';

                        return Card(
                          color: theme.cardColor,
                          child: ListTile(
                            leading: Icon(Icons.task_alt,
                                color: theme.iconTheme.color),
                            title: Text(task['title'] ?? 'Task',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(task['description'] ?? 'No description',
                                    style: TextStyle(color: Colors.blue)),
                                const SizedBox(height: 4),
                                Text('Created: $formattedDate',
                                    style: TextStyle(color: Colors.blue)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  Widget _buildWelcomeBanner() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.person, size: 40, color: Colors.white),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              "Welcome back, let's achieve your goals today!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
