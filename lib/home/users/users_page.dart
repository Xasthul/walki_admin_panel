import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/users/store/users_store.dart';
import 'package:walki_admin_panel/home/users/users_dependencies.dart';
import 'package:walki_admin_panel/home/users/utils/widget/users_content.dart';
import 'package:walki_admin_panel/home/utils/widget/default_page.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) => const UsersDependencies(
        child: _UsersPageBase(),
      );
}

class _UsersPageBase extends StatefulWidget {
  const _UsersPageBase();

  @override
  State<_UsersPageBase> createState() => _UsersPageBaseState();
}

class _UsersPageBaseState extends State<_UsersPageBase> {
  final _store = getIt<UsersStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => DefaultPage(
          title: 'Users',
          isLoading: _store.isLoading,
          content: const UsersContent(),
        ),
      );
}
