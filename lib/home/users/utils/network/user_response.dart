import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse(
    this.email,
    this.name,
    this.placesVisited,
    this.reviewsWritten,
  );

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  final String email;
  final String name;
  final int placesVisited;
  final int reviewsWritten;
}
