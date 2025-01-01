import 'package:walki_admin_panel/home/places/utils/mapper/places_mapper.dart';
import 'package:walki_admin_panel/home/places/utils/service/places_service.dart';
import 'package:walki_admin_panel/home/utils/entity/place.dart';

class PlacesUseCase {
  PlacesUseCase({
    required PlacesService placesService,
    required PlacesMapper placesMapper,
  })  : _placesService = placesService,
        _placesMapper = placesMapper;

  final PlacesService _placesService;
  final PlacesMapper _placesMapper;

  Future<List<Place>> getPlaces() async {
    final places = await _placesService.getPlaces();
    return places.map(_placesMapper.mapPlaceFromResponse).toList();
  }
}
