import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src.dart';
import '../../films/page/view/films_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (val) => transion(val, context),
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const FilmsPage(),
          Container(color: Colors.blueGrey),
          Container(color: Colors.red),
          Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, int>(
        builder: (context, state) {
          return NavigationBar(
            onDestinationSelected: (val) => transion(val, context),
            selectedIndex: state,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_sharp),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.supervised_user_circle_outlined),
                label: 'Users',
              ),
              NavigationDestination(
                icon: Icon(Icons.plus_one_rounded),
                label: 'Counter',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Counter',
              ),
            ],
          );
        },
      ),
    );
  }

  void transion(int val, BuildContext context) async {
    controller.animateToPage(
      val,
      duration: const Duration(microseconds: 400),
      curve: Curves.ease,
    );
    context.read<HomeCubit>().change(val);
  }
}
