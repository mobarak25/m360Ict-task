import 'package:get_it/get_it.dart' as i1;
import 'package:injectable/injectable.dart' as i2;
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:bs_flutter_project_task/core/navigator/flutter_navigator.dart';
import 'package:bs_flutter_project_task/core/navigator/iflutter_navigator.dart';
import 'package:bs_flutter_project_task/core/network_info/network_info.dart';
import 'package:bs_flutter_project_task/data/repositories/api_repo_impl.dart';
import 'package:bs_flutter_project_task/data/repositories/local_storage_repo_impl.dart';
import 'package:bs_flutter_project_task/domain/repositories/api_repo.dart';
import 'package:bs_flutter_project_task/domain/repositories/local_storage_repo.dart';

/// initializes the registration of provided dependencies inside of [GetIt]

i1.GetIt $initGetIt(
  i1.GetIt sl, {
  String? environment,
  i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = i2.GetItHelper(sl, environment, environmentFilter);

  gh.lazySingleton<IFlutterNavigator>(() => FlutterNavigator());

  gh.lazySingleton(() => GetStorage());

  gh.lazySingleton<LocalStorageRepo>(() => LocalStorageRepoImpl(sl()));
  gh.lazySingleton(() => InternetConnectionChecker());
  gh.lazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  gh.lazySingleton<ApiRepo>(() => ApiRepoImpl(sl()));

  return sl;
}
