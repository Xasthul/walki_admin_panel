import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/places/store/places_store.dart';

class PlacesTable extends StatefulWidget {
  const PlacesTable({super.key});

  @override
  State<PlacesTable> createState() => _PlacesTableState();
}

class _PlacesTableState extends State<PlacesTable> {
  final _store = getIt<PlacesStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) {
          if (_store.places.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: ${_store.places.length}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Selected: ${_store.selectedPlaces.length}',
                  style: const TextStyle(fontSize: 16),
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
                      label: const Text('Name'),
                      onSort: _store.onNameSort,
                    ),
                    DataColumn(
                      label: const Text('Times Visited'),
                      numeric: true,
                      onSort: _store.onTimesVisitedSort,
                    ),
                    DataColumn(
                      label: const Text('Number of Reviews'),
                      numeric: true,
                      onSort: _store.onReviewsNumberSort,
                    ),
                  ],
                  rows: _store.places
                      .map(
                        (place) => DataRow(
                          selected: _store.selectedPlaces.contains(place),
                          onSelectChanged: (isSelected) => _store.onPlaceSelected(
                            place: place,
                            isSelected: isSelected,
                          ),
                          cells: [
                            DataCell(Text(place.name)),
                            DataCell(Text('${place.timesVisited}')),
                            DataCell(Text('${place.reviewsNumber}')),
                          ],
                        ),
                      )
                      .toList(),
                ),
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
