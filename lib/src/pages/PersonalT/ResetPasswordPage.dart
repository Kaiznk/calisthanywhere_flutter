import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  ResetPasswordPage({required this.email});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void _resetPassword() async {
    try {
      // Obtiene el email y la nueva contraseña
      String newPassword = _passwordController.text.trim();

      // Cambia la contraseña del usuario actual
      await _auth.currentUser?.updatePassword(newPassword);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password has been reset successfully")),
      );

      // Redirige al usuario a la página de login
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your new password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetPassword,
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
