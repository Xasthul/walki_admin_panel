import 'package:flutter/material.dart';
import 'package:walki_admin_panel/home/utils/widget/default_table_page.dart';

class PlacesReviewsPage extends StatelessWidget {
  const PlacesReviewsPage({super.key});

  @override
  Widget build(BuildContext context) => const DefaultTablePage(
        title: "Places' reviews",
        isLoading: true,
        table: SizedBox(),
      );
}
