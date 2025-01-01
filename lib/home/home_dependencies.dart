import 'package:flutter/material.dart';
import 'package:walki_admin_panel/app/utils/di/dependency_scope.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/users/store/users_store.dart';
import 'package:walki_admin_panel/home/users/utils/mapper/users_mapper.dart';
import 'package:walki_admin_panel/home/users/utils/service/users_service.dart';
import 'package:walki_admin_panel/home/users/utils/use_case/users_use_case.dart';

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
    getIt.registerSingleton<UsersService>(UsersService());
    getIt.registerSingleton<UsersMapper>(UsersMapper());
    getIt.registerSingleton<UsersUseCase>(
      UsersUseCase(
        usersService: getIt(),
        usersMapper: getIt(),
      ),
    );
    getIt.registerSingleton<UsersStore>(
      UsersStore(
        usersUseCase: getIt(),
      )..load(),
    );
  }

  @override
  Widget build(BuildContext context) => widget._child;
}
