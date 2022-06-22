import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttter_fire_3/src/module/films/page/logic/films_read_cubit.dart';

class FilmsScreen extends StatelessWidget {
  const FilmsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FilmsScreen'),
      ),
      body: const Center(
        child: Text('FilmsScreen'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<FilmsReadCubit>().fetchData();
      }),
    );
  }
}
