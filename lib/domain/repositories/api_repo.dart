abstract class ApiRepo {
  Future<T?> get<T>({required String endpoint, dynamic body, String? token});
  Future<T?> post<T>({required String endpoint, dynamic body, String? token});
}
