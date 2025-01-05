import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/places_reviews/store/places_reviews_store.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/widget/places_reviews_table.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/widget/remove_selected_place_review_component.dart';

class PlacesReviewsContent extends StatefulWidget {
  const PlacesReviewsContent({super.key});

  @override
  State<PlacesReviewsContent> createState() => _PlacesReviewsContentState();
}

class _PlacesReviewsContentState extends State<PlacesReviewsContent> {
  final _store = getIt<PlacesReviewsStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) {
          if (_store.placesReviews.isNotEmpty) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total: ${_store.placesReviews.length}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    const PlacesReviewsTable(),
                  ],
                ),
                const SizedBox(width: 48),
                const RemoveSelectedPlaceReviewComponent(),
                const SizedBox(width: 12),
              ],
            );
          }
          return const Text(
            'There are no reviews yet.',
            style: TextStyle(fontSize: 16),
          );
        },
      );
}
