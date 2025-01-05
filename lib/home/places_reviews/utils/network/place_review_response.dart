import 'package:json_annotation/json_annotation.dart';

part 'place_review_response.g.dart';

@JsonSerializable()
class PlaceReviewResponse {
  PlaceReviewResponse(
    this.placeName,
    this.authorName,
    this.content,
    this.createdAt,
  );

  factory PlaceReviewResponse.fromJson(Map<String, dynamic> json) => _$PlaceReviewResponseFromJson(json);

  final String placeName;
  final String authorName;
  final String content;
  final String createdAt;
}
