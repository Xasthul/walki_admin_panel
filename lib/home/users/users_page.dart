import 'package:flutter/material.dart';
import 'package:walki_admin_panel/app/utils/widget/app_circular_progress_indicator.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Users',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
            Expanded(
              child: Center(
                child: AppCircularProgressIndicator(),
              ),
            ),
          ],
        ),
      );
}
