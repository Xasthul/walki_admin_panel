import 'package:walki_admin_panel/app/utils/entity/app_constants.dart';
import 'package:walki_admin_panel/app/utils/network/dio_client.dart';
import 'package:walki_admin_panel/home/places_reviews/utils/network/place_review_response.dart';

class PlacesReviewsService {
  PlacesReviewsService({
    required AuthorizedDioClient client,
  }) : _client = client;

  final AuthorizedDioClient _client;

  static const _baseUrl = '${AppConstants.serviceBaseUrl}/admin';

  Future<List<PlaceReviewResponse>> getPlacesReviews() async {
    final response = await _client.get('$_baseUrl/places-reviews');
    final items = (response as Map<String, dynamic>)['items'] as List<dynamic>;
    return items.map((item) => PlaceReviewResponse.fromJson(item as Map<String, dynamic>)).toList();
  }

  Future<void> deletePlaceReview({required String reviewId}) async =>
      _client.delete('$_baseUrl/places-reviews/$reviewId');
}
