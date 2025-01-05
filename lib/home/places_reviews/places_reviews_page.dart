import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/places_reviews/places_reviews_dependencies.dart';
import 'package:walki_admin_panel/home/places_reviews/store/places_reviews_store.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/widget/places_reviews_content.dart';
import 'package:walki_admin_panel/home/utils/widget/default_page.dart';

class PlacesReviewsPage extends StatelessWidget {
  const PlacesReviewsPage({super.key});

  @override
  Widget build(BuildContext context) => const PlacesReviewsDependencies(
        child: _PlacesReviewsPageBase(),
      );
}

class _PlacesReviewsPageBase extends StatefulWidget {
  const _PlacesReviewsPageBase();

  @override
  State<_PlacesReviewsPageBase> createState() => _PlacesReviewsPageBaseState();
}

class _PlacesReviewsPageBaseState extends State<_PlacesReviewsPageBase> {
  final _store = getIt<PlacesReviewsStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => DefaultPage(
          title: "Places' reviews",
          isLoading: _store.isLoading,
          content: const PlacesReviewsContent(),
        ),
      );
}
