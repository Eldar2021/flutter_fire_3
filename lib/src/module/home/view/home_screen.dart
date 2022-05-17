import 'package:flutter/material.dart';
import 'package:fluttter_fire_3/src/module/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.signUp);
            },
            child: const Text('Sign Up'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Sign In'),
          ),
          Row()
        ],
      ),
    );
  }
}
