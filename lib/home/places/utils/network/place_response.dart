import 'package:json_annotation/json_annotation.dart';

part 'place_response.g.dart';

@JsonSerializable()
class PlaceResponse {
  PlaceResponse(
    this.name,
    this.timesVisited,
    this.reviewsNumber,
  );

  factory PlaceResponse.fromJson(Map<String, dynamic> json) => _$PlaceResponseFromJson(json);

  final String name;
  final int timesVisited;
  final int reviewsNumber;
}
