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
}
