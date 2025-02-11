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
  Future<List<dynamic>> _fetchClientWorkouts() async {
    DataQueryBuilder queryBuilder = DataQueryBuilder();
    queryBuilder.whereClause = "client_id = '${widget.userId}'";

    List<dynamic>? result =
        await Backendless.data.of("workouts").find(queryBuilder: queryBuilder);
    return result ?? [];
  }

  Future<List<dynamic>> _fetchTasks() async {
    DataQueryBuilder queryBuilder = DataQueryBuilder();
    queryBuilder.whereClause = "client_id = '${widget.userId}'";

    List<dynamic>? result =
        await Backendless.data.of("tasks").find(queryBuilder: queryBuilder);
    return result ?? [];
  }

  Future<String> _fetchUsername() async {
    try {
      Map<dynamic, dynamic>? user =
          await Backendless.data.of("users").findById(widget.userId);
      return user?["name"] ?? "Client"; // Cambié "full_name" por "name"
    } catch (e) {
      debugPrint("Error fetching username: $e");
      return "Client"; // Si no se encuentra el nombre, se muestra "Client"
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String>(
          future: _fetchUsername(),
          builder: (context, snapshot) {
            return Text(
              "Welcome, ${snapshot.data ?? 'Client'}!",
              style: TextStyle(color: Colors.white),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: theme.primaryColor,
        elevation: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Workouts", style: theme.textTheme.titleLarge),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _fetchClientWorkouts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No workouts available"));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var workout = snapshot.data![index];
                      return ListTile(
                        title:
                            Text(workout['workout_name'] ?? 'Unnamed Workout'),
                        subtitle:
                            Text(workout['description'] ?? 'No description'),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text("Tasks", style: theme.textTheme.titleLarge),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _fetchTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No tasks available"));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var task = snapshot.data![index];
                      String formattedDate = task['created_at'] != null
                          ? DateFormat.yMMMd().add_jm().format(
                              DateTime.tryParse(task['created_at']) ??
                                  DateTime.now())
                          : 'Unknown date';
                      return ListTile(
                        title: Text(task['task_name'] ?? 'Unnamed Task'),
                        subtitle: Text("Due: $formattedDate"),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
