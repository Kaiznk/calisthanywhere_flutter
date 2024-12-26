import 'package:calistenico/src/pages/PersonalT/PersonalTrainerOptionsPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdditionalInfoPage extends StatefulWidget {
  final String userId;
  AdditionalInfoPage({required this.userId});

  @override
  _AdditionalInfoPageState createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends State<AdditionalInfoPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController entrenadorController = TextEditingController();
  String _selectedBodyType = 'Ectomorph'; // Default body type

  void _saveAdditionalInfo() async {
    // Validar que los campos height y weight sean numéricos
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
      // Obtener el nombre del entrenador ingresado
      String? entrenadorName = entrenadorController.text.trim();

      // Buscar el entrenador por nombre o asignar el que tiene menos clientes
      String assignedTrainerName;

      if (entrenadorName.isNotEmpty) {
        // Verificar si existe un entrenador con ese nombre
        final entrenadorSnapshot = await FirebaseFirestore.instance
            .collection('trainers')
            .where('name', isEqualTo: entrenadorName)
            .get();

        if (entrenadorSnapshot.docs.isNotEmpty) {
          assignedTrainerName = entrenadorSnapshot.docs.first['name'];
        } else {
          // Si el entrenador ingresado no existe, asignar al entrenador con menos clientes
          assignedTrainerName =
              await _obtenerEntrenadorConMenosClientesPorNombre();
        }
      } else {
        // Si no se ingresó ningún nombre, asignar al entrenador con menos clientes
        assignedTrainerName =
            await _obtenerEntrenadorConMenosClientesPorNombre();
      }

      // Actualizar la información del usuario en la base de datos
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .update({
        'height': height,
        'weight': weight,
        'goal': _goalController.text.trim(),
        'bodyType': _selectedBodyType,
        'trainerName': assignedTrainerName, // Asignar entrenador al usuario
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Information saved successfully")),
      );

      // Redirigir a la página PersonalTrainerOptionsPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PersonalTrainerOptionsPage(userId: widget.userId)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving information: ${e.toString()}")),
      );
    }
  }

// Función para obtener el entrenador con menos clientes por nombre
  Future<String> _obtenerEntrenadorConMenosClientesPorNombre() async {
    final entrenadoresSnapshot =
        await FirebaseFirestore.instance.collection('trainers').get();

    String entrenadorName = '';
    int menorNumClientes = double.maxFinite.toInt();

    for (var doc in entrenadoresSnapshot.docs) {
      int numClientes = doc['numClientes'] as int;
      if (numClientes < menorNumClientes) {
        menorNumClientes = numClientes;
        entrenadorName = doc['name'];
      }
    }
    return entrenadorName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Additional Information'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Provide Additional Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: entrenadorController,
              decoration: InputDecoration(
                labelText: 'ID del entrenador (opcional)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Height (inches)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.height),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Weight (lbs)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.fitness_center),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _goalController,
              decoration: InputDecoration(
                labelText: 'Goal',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.flag),
              ),
            ),
            SizedBox(height: 20),
            // Dropdown for Body Type
            DropdownButtonFormField<String>(
              value: _selectedBodyType,
              decoration: InputDecoration(
                labelText: 'Body Type',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              items: ['Ectomorph', 'Mesomorph', 'Endomorph']
                  .map((bodyType) => DropdownMenuItem(
                        value: bodyType,
                        child: Text(bodyType),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedBodyType = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAdditionalInfo,
              child: Text('Complete'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
