import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'films_read_state.dart';

class FilmsReadCubit extends Cubit<FilmsReadState> {
  FilmsReadCubit(this.firestore) : super(FilmsReadState());

  final FirebaseFirestore firestore;

  Future<void> fetchData() async {
    firestore.settings = const Settings(persistenceEnabled: true);
    final data = await firestore.collection('films').get();
    // final film = Film.fromJson(data.data() ?? {});
    // ignore: avoid_print
    print(data.docs[0].data());
  }
}
