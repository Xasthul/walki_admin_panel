import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/users/store/users_store.dart';
import 'package:walki_admin_panel/home/users/utils/widget/users_table.dart';
import 'package:walki_admin_panel/home/utils/widget/report_generation_component.dart';
import 'package:walki_admin_panel/home/utils/widget/table_header_component.dart';

class UsersContent extends StatefulWidget {
  const UsersContent({super.key});

  @override
  State<UsersContent> createState() => _UsersContentState();
}

class _UsersContentState extends State<UsersContent> {
  final _store = getIt<UsersStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) {
          if (_store.users.isNotEmpty) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TableHeaderComponent(
                      total: _store.users.length,
                      selected: _store.selectedUsers.length,
                    ),
                    const SizedBox(height: 12),
                    const UsersTable(),
                  ],
                ),
                const SizedBox(width: 48),
                const ReportGenerationComponent(),
                const SizedBox(width: 12),
              ],
            );
          }
          return const Text(
            'There are no users yet.',
            style: TextStyle(fontSize: 16),
          );
        },
      );
}
