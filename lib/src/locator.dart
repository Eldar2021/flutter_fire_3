import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'module/module.dart';

final sl = GetIt.I;

void setup() {
  sl
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerFactory<SignUpRepoSitory>(
      () => SignUpRepoImpl(sl<FirebaseAuth>()),
    )
    ..registerFactory(
      () => SignUpCubit(sl<SignUpRepoSitory>()),
    );
}
