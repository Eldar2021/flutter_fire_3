import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../sign_in.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.repo) : super(SignInInitial());

  final SignInRepository repo;

  Future<SignInState> signIn({
    required String email,
    required String pass,
  }) async {
    final res = await repo.signInWithEmail(email: email, pass: pass);

    res.fold((l) => emit(SignInError(l)), (r) => emit(SignInSuccess(r)));

    print(state);

    return state;
  }
}
