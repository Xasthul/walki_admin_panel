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
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 24),
              isLoading
                  ? const Expanded(
                      child: Center(child: AppCircularProgressIndicator()),
                    )
                  : content,
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
}
