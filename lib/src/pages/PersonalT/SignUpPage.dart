import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'additional_info_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Crear el usuario en Firebase Authentication
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Guardar la información del usuario en Firestore, incluyendo el rol de cliente
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'username': _usernameController.text.trim(),
          'email': _emailController.text.trim(),
          'userId': userCredential.user!.uid,
          'role': 'cliente', // Añadimos el rol de cliente
        });

        // Navegar a la página de información adicional
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AdditionalInfoPage(userId: userCredential.user!.uid),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al registrarse: ${e.toString()}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cuenta'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Crear una Nueva Cuenta',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nombre de Usuario',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un nombre de usuario';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un correo electrónico';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor, ingresa un correo electrónico válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa una contraseña';
                  } else if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                child: Text('Registrarse'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
