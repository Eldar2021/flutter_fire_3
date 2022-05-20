import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../module/module.dart';
import 'theme/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.uid}) : super(key: key);

  final String? uid;

  @override
  Widget build(BuildContext context) {
    print(uid);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeCubit>().state.theme.theme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: uid != null ? const HomePage() : const IntroPage(),
    );
  }
}
