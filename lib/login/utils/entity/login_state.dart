import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable {
  const LoginState._();

  factory LoginState.form() => const LoginForm._();

  factory LoginState.twoFactorAuthenticationSetup() => const LoginTwoFactorAuthenticationSetup._();

  factory LoginState.twoFactorAuthenticationVerification() => const LoginTwoFactorAuthenticationVerification._();

  @override
  List<Object> get props => [];
}

class LoginForm extends LoginState {
  const LoginForm._() : super._();
}

class LoginTwoFactorAuthenticationSetup extends LoginState {
  const LoginTwoFactorAuthenticationSetup._() : super._();
}

class LoginTwoFactorAuthenticationVerification extends LoginState {
  const LoginTwoFactorAuthenticationVerification._() : super._();
}
