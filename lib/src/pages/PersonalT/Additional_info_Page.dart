import 'package:calistenico/src/pages/PersonalT/PersonalTrainerOptionsPage.dart';
import 'package:flutter/material.dart';
import 'package:backendless_sdk/backendless_sdk.dart';

class AdditionalInfoPage extends StatefulWidget {
  final String userId;

  AdditionalInfoPage({required this.userId});

  @override
  _AdditionalInfoScreenState createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController entrenadorController = TextEditingController();
  String _selectedBodyType = "";

  void _saveAdditionalInfo() async {
    final height = double.tryParse(_heightController.text.trim());
    final weight = double.tryParse(_weightController.text.trim());

    if (height == null || weight == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Please enter valid numeric values for height and weight.")),
      );
      return;
    }

    try {
      // Obtener el `objectId` real del usuario
      var queryBuilder = DataQueryBuilder()
        ..whereClause = "objectId = '${widget.userId}'";

      var users =
          await Backendless.data.of('users').find(queryBuilder: queryBuilder);

      if (users!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: User not found.")),
        );
        return;
      }

      String objectId =
          users!.first['objectId']; // Obtener el ID real del usuario
      String? entrenadorName = entrenadorController.text.trim();
      String assignedTrainerName = await _assignTrainer(entrenadorName);

      Map<String, dynamic> updatedUser = {
        "objectId": objectId, // Usar el objectId correcto
        "height": height,
        "weight": weight,
        "goal": _goalController.text.trim(),
        "bodyType": _selectedBodyType,
        "trainerName": assignedTrainerName,
      };

      await Backendless.data.of('users').save(updatedUser);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Information saved successfully")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ClientDashboard(userId: widget.userId)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving information: ${e.toString()}")),
      );
    }
  }

  Future<String> _assignTrainer(String? entrenadorName) async {
    if (entrenadorName != null && entrenadorName.isNotEmpty) {
      return entrenadorName;
    }
    return await _obtenerEntrenadorConMenosClientesPorNombre();
  }

  Future<String> _obtenerEntrenadorConMenosClientesPorNombre() async {
    try {
      var trainers = await Backendless.data.of('trainers').find();
      if (trainers == null || trainers.isEmpty) {
        return 'DefaultTrainer'; // Asignar un entrenador predeterminado
      }

      Map<String, int> trainerCounts = {};

      for (var trainer in trainers) {
        String trainerName = trainer['name'];
        var queryBuilder = DataQueryBuilder()
          ..whereClause = "trainerName = '$trainerName'";

        var clients =
            await Backendless.data.of('users').find(queryBuilder: queryBuilder);
        trainerCounts[trainerName] = clients?.length ?? 0;
      }

      // Encontrar el entrenador con menos clientes
      String assignedTrainer = trainers.first['name'];
      int minClients =
          trainerCounts[assignedTrainer] ?? double.maxFinite.toInt();

      trainerCounts.forEach((trainer, count) {
        if (count < minClients) {
          assignedTrainer = trainer;
          minClients = count;
        }
      });

      return assignedTrainer;
    } catch (e) {
      print("Error finding trainer: ${e.toString()}");
      return 'DefaultTrainer'; // En caso de error, asignar un entrenador predeterminado
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Additional Information")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Height (cm)"),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Weight (kg)"),
            ),
            TextField(
              controller: _goalController,
              decoration: InputDecoration(labelText: "Goal"),
            ),
            DropdownButton<String>(
              value: _selectedBodyType,
              items: ["", "Ectomorph", "Mesomorph", "Endomorph"]
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.isEmpty ? "Select Body Type" : value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedBodyType = newValue ?? "";
                });
              },
            ),
            TextField(
              controller: entrenadorController,
              decoration: InputDecoration(labelText: "Trainer Name (optional)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAdditionalInfo,
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
