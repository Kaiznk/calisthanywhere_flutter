import 'package:backendless_sdk/backendless_sdk.dart';

class DatabaseService {
  final String userId;

  DatabaseService(this.userId);

  // Guardar una sesión de entrenamiento (workout)
  Future<void> addWorkout(Map<String, dynamic> workout) async {
    try {
      workout['userId'] = userId; // Asociamos el userId a la sesión
      await Backendless.data
          .of('workouts')
          .save(workout); // Guardamos en la tabla 'workouts'
      print('Sesión de entrenamiento guardada con éxito');
    } catch (e) {
      print('Error al guardar la sesión de entrenamiento: $e');
    }
  }

  // Guardar una tarea
  Future<void> addTask(Map<String, dynamic> task) async {
    try {
      task['userId'] = userId; // Asociamos el userId a la tarea
      await Backendless.data
          .of('tasks')
          .save(task); // Guardamos en la tabla 'tasks'
      print('Tarea guardada con éxito');
    } catch (e) {
      print('Error al guardar la tarea: $e');
    }
  }

  // Guardar un mensaje
  Future<void> addMessage(Map<String, dynamic> message) async {
    try {
      message['userId'] = userId; // Asociamos el userId al mensaje
      await Backendless.data
          .of('messages')
          .save(message); // Guardamos en la tabla 'messages'
      print('Mensaje guardado con éxito');
    } catch (e) {
      print('Error al guardar el mensaje: $e');
    }
  }

  // Obtener las sesiones de entrenamiento del usuario
  Future<List<Map<String, dynamic>>> getWorkoutsByUserId() async {
    try {
      var queryBuilder = DataQueryBuilder()
        ..whereClause = "userId = '$userId'"; // Filtro por userId
      var result = await Backendless.data
          .of('workouts')
          .find(queryBuilder: queryBuilder); // Buscamos los registros
      return result!
          .map((item) => item as Map<String, dynamic>)
          .toList(); // Mapeamos el resultado
    } catch (e) {
      print("Error al obtener los workouts: $e");
      return [];
    }
  }

  // Obtener las tareas del usuario
  Future<List<Map<String, dynamic>>> getTasks() async {
    try {
      var queryBuilder = DataQueryBuilder()
        ..whereClause = "userId = '$userId'"; // Filtro
      var result =
          await Backendless.data.of('tasks').find(queryBuilder: queryBuilder);
      return result!.map((item) => item as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error al obtener las tareas: $e');
      return [];
    }
  }

  // Obtener los mensajes del usuario
  Future<List<Map<String, dynamic>>> getMessages() async {
    try {
      var queryBuilder = DataQueryBuilder()
        ..whereClause = "userId = '$userId'"; // Filtro
      var result = await Backendless.data
          .of('messages')
          .find(queryBuilder: queryBuilder);
      return result!.map((item) => item as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error al obtener los mensajes: $e');
      return [];
    }
  }

  // Obtener la rutina del usuario
  Future<Map<String, dynamic>> getRoutine() async {
    try {
      var queryBuilder = DataQueryBuilder()
        ..whereClause = "userId = '$userId'"; // Filtro
      var result = await Backendless.data
          .of('routines')
          .find(queryBuilder: queryBuilder);
      if (result!.isNotEmpty) {
        return result.first
            as Map<String, dynamic>; // Retorna la primera rutina si la hay
      } else {
        return {}; // Si no hay resultados, retorna un mapa vacío
      }
    } catch (e) {
      print('Error al obtener la rutina: $e');
      return {}; // Retorna un mapa vacío en caso de error
    }
  }
}
