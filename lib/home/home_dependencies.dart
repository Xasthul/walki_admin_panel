import 'package:flutter/material.dart';
import 'package:walki_admin_panel/app/utils/di/dependency_scope.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/store/home_store.dart';
import 'package:walki_admin_panel/home/utils/use_case/home_use_case.dart';

class HomeDependencies extends StatefulWidget {
  const HomeDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<HomeDependencies> createState() => _HomeDependenciesState();
}

class _HomeDependenciesState extends State<HomeDependencies> with DependencyScope {
  @override
  void registerDependencies() {
    getIt.registerSingleton<HomeUseCase>(
      HomeUseCase(
        localStorage: getIt(),
      ),
    );
    getIt.registerSingleton<HomeStore>(
      HomeStore(
        homeUseCase: getIt(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => widget._child;
}
