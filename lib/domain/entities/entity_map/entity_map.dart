import 'package:bs_flutter_project_task/domain/entities/default_response.dart';

class EntityMap {
  static T? fromJson<T, K>(dynamic json) {
    switch (T) {
      case const (DefaultResponse):
        return DefaultResponse.fromJson(json) as T;

      default:
        throw Exception('Unknown class');
    }
  }
}
