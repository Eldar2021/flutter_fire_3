import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttter_fire_3/src/module/films/page/logic/films_read_cubit.dart';

import 'fims_view.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilmsReadCubit(FirebaseFirestore.instance)..fetchData(),
      child: const FilmsScreen(),
    );
  }
}
