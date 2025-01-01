import 'package:flutter/material.dart';
import 'package:walki_admin_panel/home/users/utils/widget/users_table.dart';
import 'package:walki_admin_panel/home/utils/widget/default_page.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) => const DefaultPage(
        title: 'Users',
        isLoading: false,
        content: UsersTable(),
      );
}
