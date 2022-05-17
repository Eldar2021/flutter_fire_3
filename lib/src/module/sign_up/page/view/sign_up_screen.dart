import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpScreen'),
      ),
      body: Form(
        child: Column(
          children: [
            const Text('Sign Up'),
            TextFormField(controller: _email),
            TextFormField(controller: _password),
          ],
        ),
      ),
    );
  }
}
