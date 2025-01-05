import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/places_reviews/store/places_reviews_store.dart';

class RemoveSelectedPlaceReviewComponent extends StatefulWidget {
  const RemoveSelectedPlaceReviewComponent({super.key});

  @override
  State<RemoveSelectedPlaceReviewComponent> createState() => _RemoveSelectedPlaceReviewComponentState();
}

class _RemoveSelectedPlaceReviewComponentState extends State<RemoveSelectedPlaceReviewComponent> {
  final _store = getIt<PlacesReviewsStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Remove the selected\nplace review: ',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((state) {
                  if (state.contains(WidgetState.disabled)) {
                    return Colors.grey[300];
                  }
                  return Colors.redAccent[200];
                }),
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: _store.selectedPlaceReview != null //
                  ? _store.removeSelectedReview
                  : null,
              child: const Text('Remove'),
            ),
          ],
        ),
      );
}
