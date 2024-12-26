import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _sendPasswordReset() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset link sent to your email')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendPasswordReset,
              child: Text('Send Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}
