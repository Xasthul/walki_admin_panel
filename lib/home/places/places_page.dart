import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/places/places_dependencies.dart';
import 'package:walki_admin_panel/home/places/store/places_store.dart';
import 'package:walki_admin_panel/home/places/utils/widget/places_content.dart';
import 'package:walki_admin_panel/home/utils/widget/default_page.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({super.key});

  @override
  Widget build(BuildContext context) => const PlacesDependencies(
        child: _PlacesPageBase(),
      );
}

class _PlacesPageBase extends StatefulWidget {
  const _PlacesPageBase();

  @override
  State<_PlacesPageBase> createState() => _PlacesPageBaseState();
}

class _PlacesPageBaseState extends State<_PlacesPageBase> {
  final _store = getIt<PlacesStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => DefaultPage(
          title: 'Places',
          isLoading: _store.isLoading,
          content: const PlacesContent(),
        ),
      );
}
