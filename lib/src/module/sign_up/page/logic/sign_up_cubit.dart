import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.repo) : super(SignUpInitial());

  final SignUpRepoSitory repo;

  Future<void> signUpEmail({
    required String email,
    required String pass,
  }) async {
    final res = await repo.signUpEmail(email: email, password: pass);
    // print(res);

    res.fold((l) => emit(SignUpError(l)), (r) => emit(SignUpSuccess(r)));
    // print(state);
  }
}
