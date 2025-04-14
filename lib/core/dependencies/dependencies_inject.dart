// coverage:ignore-file
import 'package:get_it/get_it.dart';
import 'package:bs_flutter_project_task/core/dependencies/dependencies.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
