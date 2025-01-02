import 'package:equatable/equatable.dart';
import 'package:walki_admin_panel/login/utils/entity/two_factor_authentication_setup_data.dart';

sealed class LoginState extends Equatable {
  const LoginState._();

  factory LoginState.form() => const LoginForm._();

  factory LoginState.twoFactorAuthenticationSetup(TwoFactorAuthenticationSetupData setupData) =>
      LoginTwoFactorAuthenticationSetup._(setupData);

  factory LoginState.twoFactorAuthenticationVerification() => const LoginTwoFactorAuthenticationVerification._();

  @override
  List<Object> get props => [];
}

class LoginForm extends LoginState {
  const LoginForm._() : super._();
}

class LoginTwoFactorAuthenticationSetup extends LoginState {
  const LoginTwoFactorAuthenticationSetup._(this.setupData) : super._();

  final TwoFactorAuthenticationSetupData setupData;
}

class LoginTwoFactorAuthenticationVerification extends LoginState {
  const LoginTwoFactorAuthenticationVerification._() : super._();
}
