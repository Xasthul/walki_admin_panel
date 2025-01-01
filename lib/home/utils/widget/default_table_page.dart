import 'package:flutter/material.dart';
import 'package:walki_admin_panel/app/utils/widget/app_circular_progress_indicator.dart';

class DefaultTablePage extends StatelessWidget {
  const DefaultTablePage({
    super.key,
    required this.title,
    required this.isLoading,
    required this.table,
  });

  final String title;
  final bool isLoading;
  final Widget table;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
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
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: table,
                        ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      );
}
