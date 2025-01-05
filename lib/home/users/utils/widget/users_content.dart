import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/users/store/users_store.dart';
import 'package:walki_admin_panel/home/users/utils/widget/users_table.dart';
import 'package:walki_admin_panel/home/utils/entity/generate_report_type.dart';
import 'package:walki_admin_panel/home/utils/entity/user.dart';
import 'package:walki_admin_panel/home/utils/use_case/download_pdf.dart';
import 'package:walki_admin_panel/home/utils/widget/pdf_table.dart';
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
                ReportGenerationComponent(onGenerateReport: _generateReport),
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

  Future<void> _generateReport(GenerateReportType reportType) async {
    List<User> users;
    switch (reportType) {
      case GenerateReportForNRows():
        users = _store.users.take(reportType.numberOfRows).toList();
      case GenerateReportForSelectedRows():
        users = _store.users.where(_store.selectedUsers.contains).toList();
    }
    if (users.isEmpty) {
      return;
    }
    final pdfBytes = await PdfTable.generate(
      reportType: reportType,
      columns: [
        PdfTableColumn(name: 'Email', isNumeric: false),
        PdfTableColumn(name: 'Name', isNumeric: false),
        PdfTableColumn(name: 'Places Visited', isNumeric: true),
        PdfTableColumn(name: 'Reviews Written', isNumeric: true),
      ],
      rows: users
          .map(
            (user) => PdfTable.row(
              [
                PdfTable.cell(user.email),
                PdfTable.cell(user.name),
                PdfTable.cell('${user.placesVisited}', endAlignment: true),
                PdfTable.cell('${user.reviewsWritten}', endAlignment: true),
              ],
            ),
          )
          .toList(),
    );
    downloadPdf(
      name: "Walki Report Users ${DateTime.now().millisecondsSinceEpoch}",
      bytes: pdfBytes,
    );
  }
}
