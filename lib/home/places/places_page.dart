import 'package:flutter/material.dart';
import 'package:walki_admin_panel/home/utils/widget/default_table_page.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({super.key});

  @override
  Widget build(BuildContext context) => const DefaultTablePage(
        title: 'Places',
        isLoading: true,
        table: SizedBox(),
      );
}
