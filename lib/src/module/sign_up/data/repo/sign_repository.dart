import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';

abstract class SignUpRepoSitory {
  Future<Either<Exception, UserCredential>> signUpEmail({
    required String email,
    required String password,
  });
}

class SignUpRepoImpl implements SignUpRepoSitory {
  SignUpRepoImpl(this.fAuth);

  final FirebaseAuth fAuth;

  @override
  Future<Either<Exception, UserCredential>> signUpEmail({
    required String email,
    required String password,
  }) async {
    try {
      final res = await fAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(res);
    } catch (e) {
      return Left(SignUpExc(e.toString()));
    }
  }
}
