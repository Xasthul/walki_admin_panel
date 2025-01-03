import 'package:dio/dio.dart';
import 'package:walki_admin_panel/app/utils/network/authorization_interceptor.dart';
import 'package:walki_admin_panel/app/utils/network/dio_client.dart';
import 'package:walki_admin_panel/app/utils/storage/local_storage.dart';

abstract class DioClientFactory {
  static GenericDioClient createGenericDioClient() {
    final headers = {'Content-Type': 'application/json'};
    final dio = Dio(
      BaseOptions(
        headers: headers,
        // extra: {'withCredentials': true},
      ),
    );
    dio.interceptors.add(LogInterceptor());
    return GenericDioClient(dio: dio);
  }

  static AuthorizedDioClient createAuthorizedDioClient({required LocalStorage localStorage}) {
    final headers = {'Content-Type': 'application/json'};
    final dio = Dio(BaseOptions(headers: headers));
    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(
      AuthorizationInterceptor(dio: dio, localStorage: localStorage),
    );
    return AuthorizedDioClient(dio: dio);
  }
}
