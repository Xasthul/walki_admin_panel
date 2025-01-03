import 'package:json_annotation/json_annotation.dart';

part 'authentication_response.g.dart';

@JsonSerializable()
class AuthenticationResponse {
  AuthenticationResponse(this.accessToken);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) => _$AuthenticationResponseFromJson(json);

  final String accessToken;
}
