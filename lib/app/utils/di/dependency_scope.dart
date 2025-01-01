import 'package:flutter/widgets.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';

mixin DependencyScope<T extends StatefulWidget> on State<T> {
  String get _scopeName => (T).toString();

  @override
  void initState() {
    super.initState();
    if (!getIt.hasScope(_scopeName)) {
      getIt.pushNewScope(scopeName: _scopeName);
      registerDependencies();
    }
  }

  void registerDependencies();

  @override
  @mustCallSuper
  void dispose() {
    getIt.dropScope(_scopeName);
    super.dispose();
  }
}
