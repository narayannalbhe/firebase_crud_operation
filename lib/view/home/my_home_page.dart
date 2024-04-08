

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Firebase Cli App'),
        ),
        body: Column(
          children: [
            Text('Login and SignUp'),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: userName,
                    keyboardType: TextInputType.text,
                    autofillHints: [AutofillHints.username],

                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                ],
              ),

            ),

            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    UserCredential userCredential =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: userName.text,
                      password: password.text,
                    );
                    print('Sign up successful! User ID: ${userCredential.user!.uid}');
                  } catch (e) {
                    print('Error signing up: $e');

                  }
                }
              },
              child: Text('Submit'),
            ),
          ],
        )
    );
  }
  void signUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Sign up successful! User ID: ${userCredential.user!.uid}');
      // Optionally, you can add additional code here to store user data in Firestore, etc.
    } catch (e) {
      print('Error signing up: $e');
      // Handle error (display error message, log, etc.)
    }
  }



}