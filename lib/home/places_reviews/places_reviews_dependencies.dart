import 'package:flutter/material.dart';
import 'package:walki_admin_panel/app/utils/di/dependency_scope.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/places_reviews/store/places_reviews_store.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/mapper/places_reviews_mapper.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/service/places_reviews_service.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/use_case/places_reviews_use_case.dart';

class PlacesReviewsDependencies extends StatefulWidget {
  const PlacesReviewsDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<PlacesReviewsDependencies> createState() => _PlacesReviewsDependenciesState();
}

class _PlacesReviewsDependenciesState extends State<PlacesReviewsDependencies> with DependencyScope {
  @override
  void registerDependencies() {
    getIt.registerSingleton<PlacesReviewsService>(
      PlacesReviewsService(
        client: getIt(),
      ),
    );
    getIt.registerSingleton<PlacesReviewsMapper>(PlacesReviewsMapper());
    getIt.registerSingleton<PlacesReviewsUseCase>(
      PlacesReviewsUseCase(
        placesReviewsService: getIt(),
        placesReviewsMapper: getIt(),
      ),
    );
    getIt.registerSingleton<PlacesReviewsStore>(
      PlacesReviewsStore(
        placesReviewsUseCase: getIt(),
      )..load(),
    );
  }

  @override
  Widget build(BuildContext context) => widget._child;
}
