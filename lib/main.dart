import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'firebase_options.dart';
import 'src/app/theme/theme_cubit.dart';
import 'src/src.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final appDocumentDir = await path.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  setup();
  // await sl<HiveService>().clear<String>(userUidBox);
  final userUid = await sl<HiveService>().read<String>(
    boxName: userUidBox,
    key: userUidKey,
  );
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: MyApp(uid: userUid),
  ));
}
