import 'package:bs_flutter_project_task/app.dart';
import 'package:bs_flutter_project_task/core/dependencies/dependencies_inject.dart';
import 'package:bs_flutter_project_task/core/network_info/network_info.dart';
import 'package:bs_flutter_project_task/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  await GetStorage.init();

  runApp(MyApp(getIt<NetworkInfo>()));
}
