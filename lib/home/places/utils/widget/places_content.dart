import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/places/store/places_store.dart';
import 'package:walki_admin_panel/home/places/utils/widget/places_table.dart';
import 'package:walki_admin_panel/home/utils/widget/table_header_component.dart';

class PlacesContent extends StatefulWidget {
  const PlacesContent({super.key});

  @override
  State<PlacesContent> createState() => _PlacesContentState();
}

class _PlacesContentState extends State<PlacesContent> {
  final _store = getIt<PlacesStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) {
          if (_store.places.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableHeaderComponent(
                  total: _store.places.length,
                  selected: _store.selectedPlaces.length,
                ),
                const SizedBox(height: 12),
                const PlacesTable(),
              ],
            );
          }
          return const Text(
            'There are no places yet.',
            style: TextStyle(fontSize: 16),
          );
        },
      );
}
