import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Screen'),
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.signIn);
                },
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }

  BlocListener<SignUpCubit, SignUpState> _logic(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) => true,
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushAndRemoveUntil<HomePage>(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ),
            (route) => false,
          );
        } else if (state is SignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.exception.toString()),
            ),
          );
        }
      },
      child: ElevatedButton(
        onPressed: () {
          if (_key.currentState!.validate()) {
            context.read<SignUpCubit>().signUpEmail(
                  email: _email.text,
                  pass: _password.text,
                );
          }
        },
        child: const Text('Sign Up'),
      ),
    );
  }
}
