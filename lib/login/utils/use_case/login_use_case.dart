import 'package:walki_admin_panel/app/utils/storage/local_storage.dart';
import 'package:walki_admin_panel/login/utils/entity/two_factor_authentication_setup_data.dart';
import 'package:walki_admin_panel/login/utils/service/login_service.dart';

class LoginUseCase {
  LoginUseCase({
    required LoginService loginService,
    required LocalStorage localStorage,
  })  : _loginService = loginService,
        _localStorage = localStorage;

  final LoginService _loginService;
  final LocalStorage _localStorage;

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

  Future<void> authenticate({
    required String username,
    required String password,
    required String authenticationCode,
  }) async {
    final accessToken = await _loginService.authenticate(
      username: username,
      password: password,
      authenticationCode: authenticationCode,
    );
    await _localStorage.saveAccessToken(accessToken);
  }
}
