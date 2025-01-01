import 'package:walki_admin_panel/app/utils/entity/app_constants.dart';
import 'package:walki_admin_panel/app/utils/network/dio_client.dart';
import 'package:walki_admin_panel/home/places/utils/network/place_response.dart';

class PlacesService {
  PlacesService({
    required GenericDioClient client,
  }) : _client = client;

  final GenericDioClient _client;

  static const _baseUrl = '${AppConstants.serviceBaseUrl}/admin';

  Future<List<PlaceResponse>> getPlaces() async {
    final response = await _client.get('$_baseUrl/places');
    final items = (response as Map<String, dynamic>)['items'] as List<dynamic>;
    return items.map((item) => PlaceResponse.fromJson(item as Map<String, dynamic>)).toList();
  }
}
