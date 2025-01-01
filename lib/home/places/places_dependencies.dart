import 'package:flutter/material.dart';
import 'package:walki_admin_panel/app/utils/di/dependency_scope.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/places/store/places_store.dart';
import 'package:walki_admin_panel/home/places/utils/mapper/places_mapper.dart';
import 'package:walki_admin_panel/home/places/utils/service/places_service.dart';
import 'package:walki_admin_panel/home/places/utils/use_case/places_use_case.dart';

class PlacesDependencies extends StatefulWidget {
  const PlacesDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<PlacesDependencies> createState() => _PlacesDependenciesState();
}

class _PlacesDependenciesState extends State<PlacesDependencies> with DependencyScope {
  @override
  void registerDependencies() {
    getIt.registerSingleton<PlacesService>(
      PlacesService(
        client: getIt(),
      ),
    );
    getIt.registerSingleton<PlacesMapper>(PlacesMapper());
    getIt.registerSingleton<PlacesUseCase>(
      PlacesUseCase(
        placesService: getIt(),
        placesMapper: getIt(),
      ),
    );
    getIt.registerSingleton<PlacesStore>(
      PlacesStore(
        placesUseCase: getIt(),
      )..load(),
    );
  }

  @override
  Widget build(BuildContext context) => widget._child;
}
