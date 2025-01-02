import 'package:mobx/mobx.dart';
import 'package:walki_admin_panel/login/utils/entity/login_state.dart';
import 'package:walki_admin_panel/login/utils/entity/two_factor_authentication_setup_data.dart';
import 'package:walki_admin_panel/login/utils/use_case/login_use_case.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  LoginStoreBase({
    required LoginUseCase loginUseCase,
  }) : _loginUseCase = loginUseCase;

  final LoginUseCase _loginUseCase;

  @readonly
  LoginState _state = LoginState.form();
  @readonly
  String _username = '';
  @readonly
  String _password = '';
  @readonly
  TwoFactorAuthenticationSetupData? _setupData;
  @readonly
  bool _isLoading = false;

  @computed
  bool get canLogin => _username.isNotEmpty && _password.isNotEmpty;

  @action
  Future<void> login() async {
    _isLoading = true;
    try {
      final isTwoFactorAuthenticationEnabled = await _loginUseCase.login(
        username: _username,
        password: _password,
      );
      if (!isTwoFactorAuthenticationEnabled) {
        _setupData = await _loginUseCase.generateTwoFactorAuthenticationSetupData(
          username: _username,
          password: _password,
        );
        _state = LoginState.twoFactorAuthenticationSetup(_setupData!);
        return;
      }
      _state = LoginState.twoFactorAuthenticationVerification();
    } finally {
      _isLoading = false;
    }
  }

  @action
  void onUsernameChanged(String username) => _username = username;

  @action
  void onPasswordChanged(String password) => _password = password;

  @action
  void finishTwoFactorAuthenticationSetup() => _state = LoginState.twoFactorAuthenticationVerification();

  @action
  void returnToTwoFactorAuthenticationSetup(TwoFactorAuthenticationSetupData setupData) =>
      _state = LoginState.twoFactorAuthenticationSetup(setupData);

  @action
  void returnToLoginForm() => _state = LoginState.form();
}