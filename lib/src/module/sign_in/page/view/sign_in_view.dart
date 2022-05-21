import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Well Come My Flutter Firebase'),
              TextFormField(controller: _email),
              TextFormField(controller: _password),
              _logic(context),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _logic(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_key.currentState!.validate()) {
          final state = await context.read<SignInCubit>().signIn(
                email: _email.text,
                pass: _password.text,
              );
          if (state is SignInSuccess) {
            // ignore: use_build_context_synchronously
            await Navigator.pushAndRemoveUntil<HomePage>(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const HomePage(),
              ),
              (route) => false,
            );
          } else if (state is SignInError) {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.exception.toString()),
              ),
            );
          }
        }
      },
      child: const Text('Sign In'),
    );
  }
}
