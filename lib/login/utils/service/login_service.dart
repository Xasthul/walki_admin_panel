import 'package:walki_admin_panel/app/utils/entity/app_constants.dart';
import 'package:walki_admin_panel/app/utils/network/dio_client.dart';
import 'package:walki_admin_panel/login/utils/network/login_response.dart';

class LoginService {
  LoginService({
    required GenericDioClient client,
  }) : _client = client;

  final GenericDioClient _client;

  static const _baseUrl = '${AppConstants.serviceBaseUrl}/admin';

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final response = await _client.post(
      '$_baseUrl/login',
      body: {
        'username': username,
        'password': password,
      },
    );
    return LoginResponse.fromJson(response).isTwoFactorAuthenticationEnabled;
  }
}
