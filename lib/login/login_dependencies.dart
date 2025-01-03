import 'package:flutter/material.dart';
import 'package:walki_admin_panel/app/utils/di/dependency_scope.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/login/store/login_store.dart';
import 'package:walki_admin_panel/login/utils/service/login_service.dart';
import 'package:walki_admin_panel/login/utils/use_case/login_use_case.dart';

class LoginDependencies extends StatefulWidget {
  const LoginDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<LoginDependencies> createState() => _LoginDependenciesState();
}

class _LoginDependenciesState extends State<LoginDependencies> with DependencyScope {
  @override
  void registerDependencies() {
    getIt.registerSingleton<LoginService>(LoginService(client: getIt()));
    getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(
        loginService: getIt(),
        localStorage: getIt(),
      ),
    );
    getIt.registerSingleton<LoginStore>(LoginStore(loginUseCase: getIt()));
  }

  @override
  Widget build(BuildContext context) => widget._child;
}
