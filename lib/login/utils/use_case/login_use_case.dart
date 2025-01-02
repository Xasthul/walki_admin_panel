import 'package:walki_admin_panel/login/utils/entity/two_factor_authentication_setup_data.dart';
import 'package:walki_admin_panel/login/utils/service/login_service.dart';

class LoginUseCase {
  LoginUseCase({
    required LoginService loginService,
  }) : _loginService = loginService;

  final LoginService _loginService;

  Future<bool> login({
    required String username,
    required String password,
  }) async =>
      _loginService.login(username: username, password: password);

  Future<TwoFactorAuthenticationSetupData> generateTwoFactorAuthenticationSetupData({
    required String username,
    required String password,
  }) async {
    final response = await _loginService.generateTwoFactorAuthenticationSetupData(
      username: username,
      password: password,
    );
    return TwoFactorAuthenticationSetupData(
      code: response.secret,
      qrCode: response.qrCode.replaceFirst('data:image/png;base64,', ''),
    );
  }
}
