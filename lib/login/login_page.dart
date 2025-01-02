import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/app/utils/widget/loading_shirm.dart';
import 'package:walki_admin_panel/login/login_dependencies.dart';
import 'package:walki_admin_panel/login/store/login_store.dart';
import 'package:walki_admin_panel/login/utils/entity/login_state.dart';
import 'package:walki_admin_panel/login/utils/widget/login_form_component.dart';
import 'package:walki_admin_panel/login/utils/widget/login_two_factor_authentication_setup_component.dart';
import 'package:walki_admin_panel/login/utils/widget/login_two_factor_authentication_verification_component.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => const LoginDependencies(
        child: _LoginPageBase(),
      );
}

class _LoginPageBase extends StatefulWidget {
  const _LoginPageBase();

  @override
  State<_LoginPageBase> createState() => _LoginPageBaseState();
}

class _LoginPageBaseState extends State<_LoginPageBase> {
  final _store = getIt<LoginStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Observer(
          builder: (context) {
            final state = _store.state;
            return Stack(
              children: [
                switch (state) {
                  LoginForm() => const LoginFormComponent(),
                  LoginTwoFactorAuthenticationSetup() => LoginTwoFactorAuthenticationSetupComponent(
                      setupData: state.setupData,
                      onContinuePressed: _store.finishTwoFactorAuthenticationSetup,
                    ),
                  LoginTwoFactorAuthenticationVerification() =>
                    const LoginTwoFactorAuthenticationVerificationComponent(),
                },
                if (_store.isLoading) const LoadingShirm(),
              ],
            );
          },
        ),
      );
}
