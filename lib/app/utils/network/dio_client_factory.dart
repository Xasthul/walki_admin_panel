import 'package:dio/dio.dart';
import 'package:walki_admin_panel/app/utils/network/dio_client.dart';

abstract class DioClientFactory {
  static GenericDioClient createGenericDioClient() {
    final headers = {'Content-Type': 'application/json'};
    final dio = Dio(BaseOptions(headers: headers));
    dio.interceptors.add(LogInterceptor());
    return GenericDioClient(dio: dio);
  }

// static AuthorizedDioClient createAuthorizedDioClient({
//   required SecureStorage secureStorage,
//   required AuthenticationRepository authenticationRepository,
// }) {
//   final headers = {'Content-Type': 'application/json'};
//   final dio = Dio(BaseOptions(headers: headers));
//   dio.interceptors.add(LogInterceptor());
//   dio.interceptors.add(
//     AuthorizationInterceptor(
//       dio: dio,
//       secureStorage: secureStorage,
//       authenticationRepository: authenticationRepository,
//     ),
//   );
//   return AuthorizedDioClient(dio: dio);
// }
}
