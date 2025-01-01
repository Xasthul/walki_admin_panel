import 'package:walki_admin_panel/home/places/utils/network/place_response.dart';
import 'package:walki_admin_panel/home/utils/entity/place.dart';

class PlacesMapper {
  Place mapPlaceFromResponse(PlaceResponse response) => Place(
        name: response.name,
        timesVisited: response.timesVisited,
        reviewsNumber: response.reviewsNumber,
      );
}
