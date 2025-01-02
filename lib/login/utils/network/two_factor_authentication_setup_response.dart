import 'package:json_annotation/json_annotation.dart';

part 'two_factor_authentication_setup_response.g.dart';

@JsonSerializable()
class TwoFactorAuthenticationSetupResponse {
  TwoFactorAuthenticationSetupResponse(
    this.secret,
    this.qrCode,
  );

  factory TwoFactorAuthenticationSetupResponse.fromJson(Map<String, dynamic> json) =>
      _$TwoFactorAuthenticationSetupResponseFromJson(json);

  final String secret;
  final String qrCode;
}
