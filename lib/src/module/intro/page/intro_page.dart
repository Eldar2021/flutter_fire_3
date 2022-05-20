import 'package:flutter/material.dart';
import 'package:fluttter_fire_3/src/module/module.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntroPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.signIn);
              },
              child: const Text('Sign in'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.signUp);
              },
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
