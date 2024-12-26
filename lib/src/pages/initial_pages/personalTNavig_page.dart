import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importa FirebaseAuth
import '../PersonalT/PersonalTrainerOptionsPage.dart';
import '../PersonalT/ForgotPasswordPage.dart';
import '../PersonalT/SignUpPage.dart';

class PersonalTrainerPage extends StatefulWidget {
  @override
  _PersonalTrainerPageState createState() => _PersonalTrainerPageState();
}

class _PersonalTrainerPageState extends State<PersonalTrainerPage> {
  final _auth = FirebaseAuth.instance;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  bool _isValidEmail(String email) {
    // Expresión regular para verificar el formato de un correo electrónico
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    if (!_isValidEmail(_usernameController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email address.')),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      // Autenticación con Firebase
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Obtén el correo electrónico autenticado
      final userEmail = userCredential.user?.email;

      if (userEmail != null) {
        // Busca el userId en Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: userEmail)
            .limit(1)
            .get()
            .then((querySnapshot) => querySnapshot.docs.first);

        final userId = userDoc.id;

        // Navega a la siguiente página con el userId
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PersonalTrainerOptionsPage(userId: userId),
          ),
        );
      } else {
        throw FirebaseAuthException(
          code: 'email-not-found',
          message: 'Email not found in Firestore.',
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided.';
          break;
        default:
          errorMessage = 'An error occurred. Please try again.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pt_main.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Personal Training Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  TextField(
                    controller: _usernameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    child: _isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
