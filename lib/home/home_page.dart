import 'package:flutter/material.dart';
import 'package:walki_admin_panel/home/utils/widget/navigation_bar_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            const NavigationBarComponent(),
            Expanded(
              child: content,
            ),
          ],
        ),
      );
}
