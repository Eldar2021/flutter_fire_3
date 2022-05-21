import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../src.dart';

abstract class SignInRepository {
  Future<Either<Exception, UserCredential>> signInWithEmail({
    required String email,
    required String pass,
  });
}

class SignInRepoImpl implements SignInRepository {
  SignInRepoImpl(this.auth, {required this.hiveService});

  final FirebaseAuth auth;
  final HiveService hiveService;

  @override
  Future<Either<Exception, UserCredential>> signInWithEmail({
    required String email,
    required String pass,
  }) async {
    try {
      final res = await auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      hiveService.save<String>(
        boxName: userUidBox,
        key: userUidKey,
        value: res.user?.uid ?? '',
      );

      return Right(res);
    } catch (e) {
      return Left(SignInExc(e.toString()));
    }
  }
}
