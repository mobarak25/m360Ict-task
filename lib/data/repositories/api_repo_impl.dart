import 'package:injectable/injectable.dart';
import 'package:bs_flutter_project_task/core/error/custom_error.dart';
import 'package:bs_flutter_project_task/core/error/custom_exception.dart';
import 'package:bs_flutter_project_task/core/dependencies/global.dart';
import 'package:bs_flutter_project_task/core/navigator/iflutter_navigator.dart';
import 'package:bs_flutter_project_task/core/network_info/network_info.dart';
import 'package:bs_flutter_project_task/data/data_sources/remote_gateway_base.dart';
import 'package:bs_flutter_project_task/domain/repositories/api_repo.dart';

const String noInternetConnection = 'No Internet Connection';

@LazySingleton(as: ApiRepo)
class ApiRepoImpl extends RemoteGatewayBase implements ApiRepo {
  const ApiRepoImpl(this.networkInfo);

  final NetworkInfo networkInfo;

  @override
  Future<T?> get<T>({required String endpoint, body, String? token}) async {
    dynamic data;
    if (await networkInfo.isConnected) {
      data = await getMethod<T, void>(endpoint: endpoint);
    } else {
      AppException(
        CustomError(message: noInternetConnection),
        getIt<IFlutterNavigator>(),
      );
    }
    return data;
  }

  @override
  Future<T?> post<T>({
    required String endpoint,
    dynamic body,
    String? token,
  }) async {
    dynamic data;

    if (await networkInfo.isConnected) {
      data = await postMethod<T, void>(
        endpoint: endpoint,
        data: body,
        token: token,
      );
    } else {
      AppException(
        CustomError(message: noInternetConnection),
        getIt<IFlutterNavigator>(),
      );
    }
    return data;
  }
}
