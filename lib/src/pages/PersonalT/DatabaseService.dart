import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String userId;
  DatabaseService(this.userId);

  // Guardar una sesión de entrenamiento (workout)
  Future<void> addWorkout(Map<String, String> workout) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('workouts')
        .add(workout);
  }

  // Guardar una tarea
  Future<void> addTask(Map<String, String> task) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .add(task);
  }

  // Guardar un mensaje
  Future<void> addMessage(Map<String, String> message) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('messages')
        .add(message);
  }

  Future<List<Map<String, dynamic>>> getWorkoutsByUserId(String userId) async {
    try {
      var workoutCollection = FirebaseFirestore.instance
          .collection('workouts')
          .where('userId', isEqualTo: userId);

      var snapshot = await workoutCollection.get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Error al obtener los workouts: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getWorkouts() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('routinesClient')
          .where('userId', isEqualTo: userId)
          .get();

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching workouts: $e');
      return [];
    }
  }

  // Obtener las tareas del usuario
  Future<List<Map<String, dynamic>>> getTasks() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .get();
    return snapshot.docs.map((doc) {
      return {
        'name': doc['name'] ?? '',
        'dueDate': doc['dueDate'] ?? '',
      };
    }).toList();
  }

  // Obtener los mensajes del usuario
  Future<List<Map<String, dynamic>>> getMessages() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('messages')
        .get();
    return snapshot.docs.map((doc) {
      return {
        'title': doc['title'] ?? '',
        'lastSent': doc['lastSent'] ?? '',
      };
    }).toList();
  }

  // Obtener la rutina del usuario (por ejemplo, una rutina específica)
  Future<Map<String, dynamic>> getRoutine() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('routines')
        .doc('currentRoutine') // El documento específico para la rutina
        .get();
    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>;
    } else {
      return {}; // Retorna un mapa vacío si no se encuentra la rutina
    }
  }
}
