import 'package:flutter/material.dart';
import 'package:walki_admin_panel/home/utils/widget/navigation_bar_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const Center(child: Text("Users Page")),
    const Center(child: Text("Places Page")),
    const Center(child: Text("Reviews Page")),
    const Center(child: Text("Reports Page")),
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
