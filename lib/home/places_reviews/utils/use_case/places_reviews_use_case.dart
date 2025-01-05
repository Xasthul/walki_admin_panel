import 'package:walki_admin_panel/home/places_reviews/utils/entity/place_review.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/mapper/places_reviews_mapper.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/service/places_reviews_service.dart';

class PlacesReviewsUseCase {
  PlacesReviewsUseCase({
    required PlacesReviewsService placesReviewsService,
    required PlacesReviewsMapper placesReviewsMapper,
  })  : _placesReviewsService = placesReviewsService,
        _placesReviewsMapper = placesReviewsMapper;

  final PlacesReviewsService _placesReviewsService;
  final PlacesReviewsMapper _placesReviewsMapper;

  Future<List<PlaceReview>> getPlacesReviews() async {
    final placesReviews = await _placesReviewsService.getPlacesReviews();
    return placesReviews.map(_placesReviewsMapper.mapPlaceReviewFromResponse).toList();
  }
}
