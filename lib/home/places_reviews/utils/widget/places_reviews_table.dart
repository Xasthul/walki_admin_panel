import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/places_reviews/store/places_reviews_store.dart';
import 'package:walki_admin_panel/home/utils/widget/text_with_max_width.dart';

class PlacesReviewsTable extends StatefulWidget {
  const PlacesReviewsTable({super.key});

  @override
  State<PlacesReviewsTable> createState() => _PlacesReviewsTableState();
}

class _PlacesReviewsTableState extends State<PlacesReviewsTable> {
  final _store = getIt<PlacesReviewsStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => DataTable(
          border: TableBorder.all(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey,
          ),
          sortColumnIndex: _store.sortColumnIndex,
          sortAscending: _store.sortAscending,
          onSelectAll: (_) => _store.resetSelectedReview(),
          dataRowMaxHeight: double.infinity,
          columns: [
            DataColumn(
              label: const Text('Place'),
              onSort: _store.onPlaceNameSort,
            ),
            DataColumn(
              label: const Text('Author'),
              onSort: _store.onAuthorNameSort,
            ),
            DataColumn(
              label: const Text('Content'),
              onSort: _store.onContentSort,
            ),
            DataColumn(
              label: const Text('Creation Date'),
              onSort: _store.onCreatedAtSort,
            ),
          ],
          rows: _store.placesReviews
              .map(
                (review) => DataRow(
                  selected: _store.selectedPlaceReview == review,
                  onSelectChanged: (isSelected) => _store.onReviewSelected(
                    review: review,
                    isSelected: isSelected,
                  ),
                  cells: [
                    DataCell(
                      TextWithMaxWidth(text: review.placeName, maxWidth: 240),
                    ),
                    DataCell(
                      TextWithMaxWidth(text: review.authorName, maxWidth: 200),
                    ),
                    DataCell(
                      TextWithMaxWidth(text: review.content, maxWidth: 240),
                    ),
                    DataCell(
                      Text(
                        'At ${DateFormat('HH:mm').format(review.createdAt)} '
                        'on ${DateFormat('dd.MM.yyyy').format(review.createdAt)}',
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      );
}
