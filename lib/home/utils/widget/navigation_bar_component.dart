import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/store/home_store.dart';

class NavigationBarComponent extends StatefulWidget {
  const NavigationBarComponent({super.key});

  @override
  State<NavigationBarComponent> createState() => _NavigationBarComponentState();
}

class _NavigationBarComponentState extends State<NavigationBarComponent> {
  final _store = getIt<HomeStore>();

  @override
  Widget build(BuildContext context) => Container(
        width: 250,
        color: Colors.blueAccent,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
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
                  const _NavigationBarItem(
                    label: 'Users',
                    icon: Icons.person_rounded,
                    route: '/users',
                  ),
                  const _NavigationBarItem(
                    label: 'Places',
                    icon: Icons.place_rounded,
                    route: '/places',
                  ),
                  const _NavigationBarItem(
                    label: "Places' reviews",
                    icon: Icons.rate_review_rounded,
                    route: '/places-reviews',
                  ),
                  const Spacer(),
                  ListTile(
                    title: const Text('Logout', style: TextStyle(color: Colors.white)),
                    leading: const Icon(Icons.exit_to_app, color: Colors.white),
                    onTap: _store.logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        leading: Icon(icon, color: Colors.white),
        onTap: () => context.go(route),
        selectedTileColor: Colors.blue[700],
      );
}
