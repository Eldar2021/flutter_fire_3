import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttter_fire_3/src/core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'module/module.dart';

final sl = GetIt.I;

void setup() {
  sl
    ..registerLazySingleton<HiveService>(() => HiveService(Hive))
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerFactory<SignUpRepoSitory>(
      () => SignUpRepoImpl(sl<FirebaseAuth>(), hiveService: sl<HiveService>()),
    )
    ..registerFactory(
      () => SignUpCubit(sl<SignUpRepoSitory>()),
    );
}
