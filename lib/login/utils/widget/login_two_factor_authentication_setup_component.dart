import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:walki_admin_panel/login/utils/widget/login_container.dart';

class LoginTwoFactorAuthenticationSetupComponent extends StatefulWidget {
  const LoginTwoFactorAuthenticationSetupComponent({super.key});

  @override
  State<LoginTwoFactorAuthenticationSetupComponent> createState() => _LoginTwoFactorAuthenticationSetupComponentState();
}

class _LoginTwoFactorAuthenticationSetupComponentState extends State<LoginTwoFactorAuthenticationSetupComponent> {
  final _manualCodeController = TextEditingController();

  // data:image/png;base64,
  final _base64String =
      'iVBORw0KGgoAAAANSUhEUgAAAOQAAADkCAYAAACIV4iNAAAAAklEQVR4AewaftIAAAx1SURBVO3BQY4cSRLAQDLR//8yV0c/BZCoam1o4Gb2B2utKzysta7xsNa6xsNa6xoPa61rPKy1rvGw1rrGw1rrGg9rrWs8rLWu8bDWusbDWusaD2utazysta7xsNa6xsNa6xo/fEjlb6qYVE4qJpWTikllqnhDZap4Q+WbKiaVNyomlZOKSWWq+ITKVDGp/E0Vn3hYa13jYa11jYe11jV++LKKb1L5hMpU8U0qJxWTyknFScWkMlVMKicVk8qJyhsqU8WkMlVMKt9U8U0q3/Sw1rrGw1rrGg9rrWv88MtU3qj4RMWkMqlMFZPKVPFGxaQyVUwqk8pUMan8popJZap4Q2VSmSomlaliUvkmlTcqftPDWusaD2utazysta7xwz+uYlI5qTipmFS+SeWkYlKZKiaVk4oTlaliqnhDZar4TRX/JQ9rrWs8rLWu8bDWusYP/ziVqeJEZap4o+JE5aRiUplUTlROVE4qTlROKk4qflPFf9nDWusaD2utazysta7xwy+r+E0Vk8pUcaIyVUwVk8pUcVIxqUwVJypTxRsqb1ScqEwVb6i8oTJVfFPFTR7WWtd4WGtd42GtdY0fvkzlb1KZKiaVqWJSOVGZKiaVqWJSmSomlaniDZWp4ptUpopJZaqYVKaKSWWqmFROVKaKE5WbPay1rvGw1rrGw1rrGvYH/yEqb1S8oTJVnKh8U8UbKicVk8pJxYnKGxWTyicq/mUPa61rPKy1rvGw1rqG/cEHVKaKE5XfVDGpnFRMKicVk8pU8YbKVDGp/E0VJyonFZPKVDGpTBWTylQxqZxUnKhMFZPKGxWfeFhrXeNhrXWNh7XWNX74UMWkMlVMFZPKVHGicqJyUjGpTBWfUDmp+E0Vk8pUMam8UTGpfJPKGxUnKlPFVHFSMalMFd/0sNa6xsNa6xoPa61r/PBlFZPKScWk8kbFpDJVnFRMKlPFGxVvVEwq31TxCZU3VD5RcaJyUjFVnKhMFScVk8pU8YmHtdY1HtZa13hYa13jhy9TmSomlTcqJpVPqJxUTCpTxVTxhspUMVX8TRUnFZPKb1I5qZhUTlT+JQ9rrWs8rLWu8bDWusYPv0xlqphUTlSmikllqjipOFGZKk5UPqEyVZyoTBWfUDmpeKPimyreUHmj4kRlqvhND2utazysta7xsNa6hv3BX6QyVfwmld9UMalMFW+onFS8oXJS8QmVqWJSOamYVKaKE5VvqjhRmSq+6WGtdY2HtdY1HtZa1/jhl6m8oXJSMamcVPwmlaliUvlExRsqU8Wk8k0VJxWTyknFJyo+oTJVnKhMFZ94WGtd42GtdY2HtdY1fviQylRxUjGpnFRMKlPFpPKGyknFGypvVEwqJypTxYnKVDGpnFScqPw/VZyonFRMFW9UfNPDWusaD2utazysta7xw4cq3lCZKk5U3qiYVKaKqWJS+aaKSeWbVKaKSeWbVKaKSeUNlTcqJpWpYqqYVCaVqeKk4jc9rLWu8bDWusbDWusaP3xIZaqYKiaVSWWqmComlU+oTBXfVHFSMalMFZPKVPFNFW9UTCpTxaQyVXxC5Q2Vk4pJ5aRiUpkqPvGw1rrGw1rrGg9rrWvYH3yRylRxojJVTCpTxaQyVZyofKLiRGWqmFROKiaVNyo+oXJScaJyUjGpTBWTylRxojJVnKh8ouKbHtZa13hYa13jYa11DfuDD6hMFZPKVHGiMlWcqLxRMalMFZPKVDGpTBWTyicqJpWTihOVqeJEZar4hMpUcaLyRsWkMlWcqEwVJypTxSce1lrXeFhrXeNhrXWNH75MZao4UTlRmSpOKiaVSeUTKm9UnKh8k8pvUpkqTlSmiknlpGJSmSomlanijYoTld/0sNa6xsNa6xoPa61r2B98QOWNit+kclLxL1GZKiaVk4oTlTcqJpU3Kk5UTiomlaniROWkYlJ5o+ITD2utazysta7xsNa6hv3BF6mcVEwq31QxqZxUTConFZPKScWkMlWcqPyXVEwqU8UbKr+pYlKZKr7pYa11jYe11jUe1lrX+OFDKicVk8pJxRsqJxUnKt9UMal8U8UbKlPFicpUcaIyVUwqJxWTylQxqZxUvKFyovI3Pay1rvGw1rrGw1rrGj98WcU3qUwVJypvVJyoTCqfqPgmlaniROWbKiaVN1SmikllqphUTlSmijcq/qaHtdY1HtZa13hYa13jhw9VTCrfVPGJihOVqWKqOFE5qZhUTireqPhExRsqJxWTyqTyCZU3Kt6omFROKr7pYa11jYe11jUe1lrXsD/4IpWTiknl/6liUjmpmFQ+UXGi8jdVnKj8P1VMKjep+MTDWusaD2utazysta7xwy+rmFTeqHhDZap4o2JSOamYVKaKSeVEZao4UZkqJpWp4hMV/5KKSeWkYlI5qfimh7XWNR7WWtd4WGtd44e/rGJSOVH5hMpUMal8QuUTKm+onKh8k8pUMalMFScqb1RMKicVk8pJxUnFpDKpTBWfeFhrXeNhrXWNh7XWNX74kMpU8UbFGyqfUJkqJpVvUpkqPlFxojJVTCpvVEwqU8WJyhsVb1RMKlPFicpU8UbFNz2sta7xsNa6xsNa6xo/fKhiUpkq3lD5popJZVKZKiaVSWWq+ITKJypOVKaKE5VvqphU3lD5JpU3VKaKSWWq+MTDWusaD2utazysta7xw4dU3lB5o2JSmSpOVE4qJpWTikllqphU3qiYVN6oOFGZKqaKSWWqmFSmijcqJpWpYlL5mypOKr7pYa11jYe11jUe1lrXsD/4IpU3Kk5U3qiYVKaKE5WpYlL5RMWk8omKSeVvqphUTipOVKaKSeWk4g2VqWJSeaPiEw9rrWs8rLWu8bDWusYPX1ZxojKpnFScqEwqU8WJym+qOKn4pooTlZOKSeVEZaqYVE5UpopJ5RMqU8U3VXzTw1rrGg9rrWs8rLWu8cOXqXyTyknFpHKi8omKSeUNlaliUpkqTlSmiknlpOKNikllUpkqJpU3Kk5UJpU3KiaVqWJS+U0Pa61rPKy1rvGw1rrGDx9SeaNiUpkqTlQmlZtUTCpTxaTyhspUMalMFZPKpPKGyicqTlQ+UfFNKlPFpDJVfOJhrXWNh7XWNR7WWtf44UMVb6i8ofJGxScqJpU3VKaKk4o3KiaVT1ScqHxC5aRiqjhReUNlqnij4m96WGtd42GtdY2HtdY1fviQyicqJpWpYlI5UZkqPlExqUwVb6hMFZ+oOFGZKk5U3qiYVKaKE5WpYlI5qZhU3lB5Q+U3Pay1rvGw1rrGw1rrGj98qGJSmSo+ofKbKiaVqWKqeEPlm1SmiknlROWk4kRlUvl/UnlD5aRiUpkqJpVvelhrXeNhrXWNh7XWNX74ZSonFVPFicpUMam8ofIJlaniDZXfVPEJlaliUpkqJpWpYqr4TRUnKpPKGxXf9LDWusbDWusaD2uta/zwIZU3Kt5QmSq+qWJSOVE5UZkq3lB5Q+VE5RMVJxWfUDmpmFTeUHmjYlKZVE4qPvGw1rrGw1rrGg9rrWvYH/zDVE4qTlSmikllqviEylRxojJVvKEyVXxCZap4Q2WqmFSmihOVqeINlaliUpkqftPDWusaD2utazysta7xw4dU/qaKk4pPqEwVJyonFVPFpDJVvKEyVZyoTBVvVEwqU8UbKlPFN6lMFW9UnKhMFZ94WGtd42GtdY2HtdY1fviyim9S+YTKJ1ROKiaVv6nijYpJ5RMVk8pUcVIxqZxUvFHxmyq+6WGtdY2HtdY1HtZa1/jhl6m8UfEJlaliUpkqJpWp4kTlROWkYlI5UflNFZPKVPGGyonKVDGpvKHyL3tYa13jYa11jYe11jV++I9T+YTKScWkMlVMKm9UTCpTxYnKN6lMFVPFGypvqEwVk8obFW+oTBXf9LDWusbDWusaD2uta/zwj6uYVKaKE5Wp4ptUpoqTiknlROUTFZPKVPEJlaniRGWqmFQmlU+onFScqEwVn3hYa13jYa11jYe11jV++GUV/08qU8VU8YbKScWkMqmcVEwVk8pU8QmVqeITKlPFScWJylQxqZxUTCpTxYnK3/Sw1rrGw1rrGg9rrWv88GUqf5PKVPGGylQxqUwVJypvVEwqU8WJylQxqUwVU8WkMlV8k8pvqnhD5aTiROWbHtZa13hYa13jYa11DfuDtdYVHtZa13hYa13jYa11jYe11jUe1lrXeFhrXeNhrXWNh7XWNR7WWtd4WGtd42GtdY2HtdY1HtZa13hYa13jYa11jf8B4Ay5Vl7CJQcAAAAASUVORK5CYII=';

  final _manualCode = 'L4OF6VTSCJUAQUDW';

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
              base64Decode(_base64String),
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
                _manualCode,
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
              onPressed: () {
                print('Manual Code: ${_manualCodeController.text}');
              },
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
