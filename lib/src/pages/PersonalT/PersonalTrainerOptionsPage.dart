import 'package:calistenico/src/pages/PersonalT/WorkoutDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:backendless_sdk/backendless_sdk.dart';

class ClientDashboard extends StatefulWidget {
  final String userId;

  const ClientDashboard({Key? key, required this.userId}) : super(key: key);

  @override
  _ClientDashboardState createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  late Future<Map<String, dynamic>> _clientData;

  @override
  void initState() {
    super.initState();
    _clientData = _fetchClientData();
  }

  Future<Map<String, dynamic>> _fetchClientData() async {
    try {
      DataQueryBuilder queryBuilder = DataQueryBuilder()
        ..whereClause = "objectId = '${widget.userId}'";

      List<dynamic>? user =
          await Backendless.data.of("users").find(queryBuilder: queryBuilder);

      if (user!.isEmpty) {
        throw Exception("User not found");
      }

      Map<String, dynamic> userData = Map<String, dynamic>.from(user[0]);

      DataQueryBuilder routinesQuery = DataQueryBuilder()
        ..whereClause = "userId = '${widget.userId}'";
      List<dynamic>? routines = await Backendless.data
          .of("routinesClient")
          .find(queryBuilder: routinesQuery);

      DataQueryBuilder tasksQuery = DataQueryBuilder()
        ..whereClause = "userId = '${widget.userId}'";
      List<dynamic>? tasks =
          await Backendless.data.of("tasks").find(queryBuilder: tasksQuery);

      return {
        "name": userData["name"] ?? "Client",
        "workouts": routines ?? [],
        "tasks": tasks ?? [],
      };
    } catch (e) {
      debugPrint("Error fetching client data: $e");
      return {"name": "Client", "workouts": [], "tasks": []};
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<Map<String, dynamic>>(
          future: _clientData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            }
            return Text("Welcome, ${snapshot.data?["name"] ?? "Client"}!");
          },
        ),
        centerTitle: true,
        backgroundColor: theme.primaryColor,
        elevation: 5.0,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _clientData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("Error loading client data"));
          }

          var workouts = snapshot.data!["workouts"] as List<dynamic>;
          var tasks = snapshot.data!["tasks"] as List<dynamic>;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Workouts", style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Expanded(
                  child: workouts.isEmpty
                      ? const Center(child: Text("No workouts available"))
                      : ListView.builder(
                          itemCount: workouts.length,
                          itemBuilder: (context, index) {
                            var workout = workouts[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 3,
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(12),
                                title: Text(
                                    workout['nombreRout'] ?? 'Unnamed Workout',
                                    style: theme.textTheme.bodyLarge),
                                subtitle: Text(
                                    workout['tipoR'] ?? 'No description',
                                    style: theme.textTheme.bodyMedium),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WorkoutDetailPage(
                                        workoutId: workout['objectId'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ),
                const SizedBox(height: 16),
                Text("Tasks", style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Expanded(
                  child: tasks.isEmpty
                      ? const Center(child: Text("No tasks available"))
                      : ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            var task = tasks[index];
                            String formattedDate = task['createdAt'] != null
                                ? DateFormat.yMMMd().add_jm().format(
                                    DateTime.tryParse(task['createdAt']) ??
                                        DateTime.now())
                                : 'Unknown date';
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 3,
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(12),
                                title: Text(task['task_name'] ?? 'Unnamed Task',
                                    style: theme.textTheme.bodyLarge),
                                subtitle: Text("Due: $formattedDate",
                                    style: theme.textTheme.bodyMedium),
                              ),
                            );
                          },
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
