import 'package:go_router/go_router.dart';
import 'package:walki_admin_panel/home/home_page.dart';
import 'package:walki_admin_panel/home/places/places_page.dart';
import 'package:walki_admin_panel/home/places_reviews/places_reviews_page.dart';
import 'package:walki_admin_panel/home/users/users_page.dart';

final router = GoRouter(
  initialLocation: '/users',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(content: child),
      routes: [
        GoRoute(
          path: '/users',
          builder: (context, state) => const UsersPage(),
        ),
        GoRoute(
          path: '/places',
          builder: (context, state) => const PlacesPage(),
        ),
        GoRoute(
          path: '/places-reviews',
          builder: (context, state) => const PlacesReviewsPage(),
        ),
      ],
    ),
  ],
);
