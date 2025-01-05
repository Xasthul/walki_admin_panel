import 'package:walki_admin_panel/home/places_reviews/utils/entity/place_review.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/network/place_review_response.dart';

class PlacesReviewsMapper {
  PlaceReview mapPlaceReviewFromResponse(PlaceReviewResponse response) => PlaceReview(
        id: response.id,
        placeName: response.placeName,
        authorName: response.authorName,
        content: response.content,
        createdAt: DateTime.parse(response.createdAt),
      );
}
