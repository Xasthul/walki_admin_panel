import 'package:flutter/material.dart';
import 'package:walki_admin_panel/app/utils/widget/app_circular_progress_indicator.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({
    super.key,
    required this.title,
    required this.isLoading,
    required this.content,
  });

  final String title;
  final bool isLoading;
  final Widget content;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
            Expanded(
              child: isLoading //
                  ? const Center(child: AppCircularProgressIndicator())
                  : content,
            ),
          ],
        ),
      );
}
