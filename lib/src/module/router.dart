import 'package:flutter/material.dart';

import '../src.dart';

class AppRouter {
  static const String home = '/';

  static const String signUp = '/sign_up';

  static const String signIn = '/sign_in';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute<HomePage>(
          builder: (_) => const HomePage(),
        );

      case signUp:
        return MaterialPageRoute<SignUpPage>(
          builder: (_) => const SignUpPage(),
        );

      // case signIn:
      // return MaterialPageRoute<signIn>(
      //   builder: (_) => const SignIn(),
      // );

      default:
        throw RouteExc();
    }
  }
}
