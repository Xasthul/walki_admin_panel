import 'package:flutter/material.dart';
import 'package:walki_admin_panel/home/home_dependencies.dart';
import 'package:walki_admin_panel/home/places/places_page.dart';
import 'package:walki_admin_panel/home/places_reviews/places_reviews_page.dart';
import 'package:walki_admin_panel/home/reports/reports_page.dart';
import 'package:walki_admin_panel/home/users/users_page.dart';
import 'package:walki_admin_panel/home/utils/widget/navigation_bar_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const HomeDependencies(
        child: _HomePageBase(),
      );
}

class _HomePageBase extends StatefulWidget {
  const _HomePageBase();

  @override
  State<_HomePageBase> createState() => _HomePageBaseState();
}

class _HomePageBaseState extends State<_HomePageBase> {
  final List<Widget> _pages = [
    const UsersPage(),
    const PlacesPage(),
    const PlacesReviewsPage(),
    const ReportsPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            NavigationBarComponent(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      );
}
