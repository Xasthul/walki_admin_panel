import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/users/store/users_store.dart';
import 'package:walki_admin_panel/home/utils/widget/table_header_component.dart';

class UsersTable extends StatefulWidget {
  const UsersTable({super.key});

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  final _store = getIt<UsersStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) {
          if (_store.users.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableHeaderComponent(
                  total: _store.users.length,
                  selected: _store.selectedUsers.length,
                ),
                const SizedBox(height: 12),
                DataTable(
                  border: TableBorder.all(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey,
                  ),
                  sortColumnIndex: _store.sortColumnIndex,
                  sortAscending: _store.sortAscending,
                  columns: [
                    DataColumn(
                      label: const Text('Email'),
                      onSort: _store.onEmailSort,
                    ),
                    DataColumn(
                      label: const Text('Name'),
                      onSort: _store.onNameSort,
                    ),
                    DataColumn(
                      label: const Text('Places Visited'),
                      numeric: true,
                      onSort: _store.onPlacesVisitedSort,
                    ),
                    DataColumn(
                      label: const Text('Reviews Written'),
                      numeric: true,
                      onSort: _store.onReviewsWrittenSort,
                    ),
                  ],
                  rows: _store.users
                      .map(
                        (user) => DataRow(
                          selected: _store.selectedUsers.contains(user),
                          onSelectChanged: (isSelected) => _store.onUserSelected(
                            user: user,
                            isSelected: isSelected,
                          ),
                          cells: [
                            DataCell(Text(user.email)),
                            DataCell(Text(user.name)),
                            DataCell(Text('${user.placesVisited}')),
                            DataCell(Text('${user.reviewsWritten}')),
                          ],
                        ),
                      )
                      .toList(),
                ),
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
