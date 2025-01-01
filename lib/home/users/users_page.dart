import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/users/store/users_store.dart';
import 'package:walki_admin_panel/home/users/utils/widget/users_table.dart';
import 'package:walki_admin_panel/home/utils/widget/default_table_page.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final _store = getIt<UsersStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => DefaultTablePage(
          title: 'Users',
          isLoading: _store.isLoading,
          table: const UsersTable(),
        ),
      );
}
