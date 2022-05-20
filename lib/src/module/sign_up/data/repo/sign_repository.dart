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
  SignUpRepoImpl(this.fAuth, {required this.hiveService});

  final FirebaseAuth fAuth;
  final HiveService hiveService;

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
      hiveService.save<String>(
        boxName: userUidBox,
        key: userUidKey,
        value: res.user?.uid ?? '',
      );
      return Right(res);
    } catch (e) {
      return Left(SignUpExc(e.toString()));
    }
  }
}
