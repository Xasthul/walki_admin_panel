import 'package:flutter/material.dart';
import 'package:walki_admin_panel/home/utils/widget/default_table_page.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) => const DefaultTablePage(
        title: 'Reports',
        isLoading: false,
        table: SizedBox(),
      );
}
