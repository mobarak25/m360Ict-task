import 'dart:convert';
import 'dart:io';

import 'package:bs_flutter_project_task/core/error/custom_error.dart';
import 'package:bs_flutter_project_task/core/error/custom_exception.dart';
import 'package:bs_flutter_project_task/core/dependencies/global.dart';
import 'package:bs_flutter_project_task/core/navigator/iflutter_navigator.dart';
import 'package:bs_flutter_project_task/domain/entities/entity_map/entity_map.dart';
import 'package:bs_flutter_project_task/domain/repositories/local_storage_repo.dart';
import 'package:http/http.dart' as http;

const fetchDataException = 'Failed To Fetch Data';

class RemoteGatewayBase {
  const RemoteGatewayBase();

  LocalStorageRepo get _localStorageRepo => getIt<LocalStorageRepo>();

  Future<T?> getMethod<T, K>({required String endpoint}) async {
    dynamic responseJson;
    final headers = _createHeaders();
    try {
      final response = await http.get(Uri.parse(endpoint), headers: headers);
      responseJson = _handleHTTPResponse(response);
      if (responseJson != null) {
        return fromJson<T, K>(responseJson);
      }
    } on SocketException {
      FetchDataException(
        CustomError(message: fetchDataException),
        getIt<IFlutterNavigator>(),
      );
    }
    return null;
  }

  Future<T?> postMethod<T, K>({
    required String endpoint,
    dynamic data,
    String? token,
  }) async {
    dynamic responseJson;
    final headers = _createHeaders(token: token);
    try {
      final body = json.encode(data);

      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: body,
      );

      responseJson = _handleHTTPResponse(response);

      if (responseJson != null) {
        return fromJson<T, K>(responseJson);
      }
    } on SocketException {
      FetchDataException(
        CustomError(message: fetchDataException),
        getIt<IFlutterNavigator>(),
      );
    }
    return null;
  }

  Map<String, String>? _createHeaders({String? token}) {
    return <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization':
      //     'Bearer ${token ?? _localStorageRepo.read(key: tokenDB) ?? ''}',
    };
  }

  dynamic _handleHTTPResponse(http.Response response) {
    return _handleResponse(response.statusCode, response.body);
  }

  _handleResponse(int statusCode, String body) {
    print(statusCode);
    // log(body);
    final navigator = getIt<IFlutterNavigator>();

    switch (statusCode) {
      case 200:
        return json.decode(body);
      case 400:
      case 404:
        NotFoundException(error(body), navigator);
        break;
      case 401:
        UnauthorizedException(error(body), navigator, _localStorageRepo);
        break;
      case 403:
        UnauthorizedException(error(body), navigator, _localStorageRepo);
        break;
      case 422:
        InvalidInputException(error(body), navigator);
        break;
      case 500:
      default:
        FetchDataException(
          CustomError(
            message:
                'An error occurred while communicating with the server with StatusCode $statusCode',
          ),
          navigator,
        );
        break;
    }
  }

  CustomError error(String body) {
    return CustomError.fromJson(jsonDecode(body));
  }

  static T fromJson<T, K>(dynamic json) {
    if (json is Iterable) {
      return _fromJsonList<K>(json) as T;
    }
    return EntityMap.fromJson<T, K>(json) as T;
  }

  static List<K>? _fromJsonList<K>(Iterable<dynamic> jsonList) {
    return jsonList.map<K>((dynamic json) => fromJson<K, void>(json)).toList();
  }
}
