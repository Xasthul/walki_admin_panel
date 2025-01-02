import 'package:equatable/equatable.dart';

class TwoFactorAuthenticationSetupData extends Equatable {
  const TwoFactorAuthenticationSetupData({
    required this.code,
    required this.qrCode,
  });

  final String code;
  final String qrCode;

  @override
  List<Object> get props => [code, qrCode];
}
