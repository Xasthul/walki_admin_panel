import 'package:flutter/material.dart';
import 'package:walki_admin_panel/app/utils/widget/app_circular_progress_indicator.dart';

class LoadingShirm extends StatelessWidget {
  const LoadingShirm({super.key});

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.blue.withOpacity(0.1),
    width: double.maxFinite,
    height: double.maxFinite,
    child: const Center(
      child: AppCircularProgressIndicator(),
    ),
  );
}
