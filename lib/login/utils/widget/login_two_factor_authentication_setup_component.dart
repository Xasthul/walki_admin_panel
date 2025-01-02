import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:walki_admin_panel/login/utils/entity/two_factor_authentication_setup_data.dart';
import 'package:walki_admin_panel/login/utils/widget/login_container.dart';

class LoginTwoFactorAuthenticationSetupComponent extends StatelessWidget {
  const LoginTwoFactorAuthenticationSetupComponent({
    super.key,
    required TwoFactorAuthenticationSetupData setupData,
    required VoidCallback onContinuePressed,
  })  : _setupData = setupData,
        _onContinuePressed = onContinuePressed;

  final TwoFactorAuthenticationSetupData _setupData;
  final VoidCallback _onContinuePressed;

  @override
  Widget build(BuildContext context) => LoginContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Two-Factor Authentication',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Since this is your first login, please set up Two-Factor Authentication.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),
            Image.memory(
              base64Decode(_setupData.qrCode),
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              'Scan the QR code or enter the manual code:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _setupData.code,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onContinuePressed,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      );
}
