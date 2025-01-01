import 'package:flutter/material.dart';

class NavigationBarComponent extends StatelessWidget {
  const NavigationBarComponent({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) => Container(
        width: 250,
        color: Colors.blueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Walki Admin Panel',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            const Divider(color: Colors.white),
            _NavigationBarItem(
              label: 'Users',
              icon: Icons.person_rounded,
              onItemTapped: onItemTapped,
              selectedIndex: selectedIndex,
              index: 0,
            ),
            _NavigationBarItem(
              label: 'Places',
              icon: Icons.place_rounded,
              onItemTapped: onItemTapped,
              selectedIndex: selectedIndex,
              index: 1,
            ),
            _NavigationBarItem(
              label: "Places' reviews",
              icon: Icons.rate_review_rounded,
              onItemTapped: onItemTapped,
              selectedIndex: selectedIndex,
              index: 2,
            ),
            _NavigationBarItem(
              label: "Reports",
              icon: Icons.file_present_rounded,
              onItemTapped: onItemTapped,
              selectedIndex: selectedIndex,
              index: 3,
            ),
            const Spacer(),
            ListTile(
              title: const Text('Logout', style: TextStyle(color: Colors.white)),
              leading: const Icon(Icons.exit_to_app, color: Colors.white),
              onTap: () {},
            ),
          ],
        ),
      );
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    required this.label,
    required this.icon,
    required this.onItemTapped,
    required this.selectedIndex,
    required this.index,
  });

  final String label;
  final IconData icon;
  final Function(int) onItemTapped;
  final int selectedIndex;
  final int index;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        leading: Icon(icon, color: Colors.white),
        onTap: () => onItemTapped(index),
        selected: selectedIndex == index,
        selectedTileColor: Colors.blue[700],
      );
}
