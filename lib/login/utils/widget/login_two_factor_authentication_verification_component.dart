import 'package:flutter/material.dart';
import 'package:walki_admin_panel/login/utils/widget/login_container.dart';

class LoginTwoFactorAuthenticationVerificationComponent extends StatefulWidget {
  const LoginTwoFactorAuthenticationVerificationComponent({super.key});

  @override
  State<LoginTwoFactorAuthenticationVerificationComponent> createState() =>
      _LoginTwoFactorAuthenticationVerificationComponentState();
}

class _LoginTwoFactorAuthenticationVerificationComponentState
    extends State<LoginTwoFactorAuthenticationVerificationComponent> {
  final _authCodeController = TextEditingController();
  bool _isCodeVerified = false;
  String _errorMessage = '';

  final String correctCode = "123456";

  void _verifyCode() {
    setState(() {
      _errorMessage = '';
      if (_authCodeController.text == correctCode) {
        _isCodeVerified = true;
      } else {
        _isCodeVerified = false;
        _errorMessage = 'Invalid code. Please try again.';
      }
    });
  }

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
              'Enter the code generated by your authenticator app.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _authCodeController,
              decoration: InputDecoration(
                labelText: 'Authentication Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: _errorMessage.isEmpty ? null : _errorMessage,
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyCode,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Verify Code'),
            ),
            const SizedBox(height: 20),
            if (_isCodeVerified)
              const Text(
                'Code Verified! Logging you in..',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      );
}