import 'package:go_router/go_router.dart';
import 'package:walki_admin_panel/home/home_page.dart';
import 'package:walki_admin_panel/home/places/places_page.dart';
import 'package:walki_admin_panel/home/places_reviews/places_reviews_page.dart';
import 'package:walki_admin_panel/home/users/users_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/users',
    ),
    ShellRoute(
      builder: (context, state, child) => HomePage(content: child),
      routes: [
        GoRoute(
          path: '/users',
          pageBuilder: (context, state) => _NoTransition(state, child: const UsersPage()),
        ),
        GoRoute(
          path: '/places',
          pageBuilder: (context, state) => _NoTransition(state, child: const PlacesPage()),
        ),
        GoRoute(
          path: '/places-reviews',
          pageBuilder: (context, state) => _NoTransition(state, child: const PlacesReviewsPage()),
        ),
      ],
    ),
  ],
);

class _NoTransition extends CustomTransitionPage {
  _NoTransition(GoRouterState state, {required super.child})
      : super(
          key: state.pageKey,
          transitionsBuilder: (_, __, ___, child) => child,
          reverseTransitionDuration: Duration.zero,
          transitionDuration: Duration.zero,
        );
}
