import 'package:flutter/material.dart';
import 'package:walki_admin_panel/app/utils/di/dependency_scope.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/app/utils/network/dio_client.dart';
import 'package:walki_admin_panel/app/utils/network/dio_client_factory.dart';

class ApplicationDependencies extends StatefulWidget {
  const ApplicationDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<ApplicationDependencies> createState() => _ApplicationDependenciesState();
}

class _ApplicationDependenciesState extends State<ApplicationDependencies> with DependencyScope {
  @override
  void registerDependencies() {
    getIt.registerSingleton<GenericDioClient>(
      DioClientFactory.createGenericDioClient(),
    );
  }

  @override
  Widget build(BuildContext context) => widget._child;
}
