import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:walki_admin_panel/home/home_page.dart';
import 'package:walki_admin_panel/home/places/places_page.dart';
import 'package:walki_admin_panel/home/places_reviews/places_reviews_page.dart';
import 'package:walki_admin_panel/home/users/users_page.dart';
import 'package:walki_admin_panel/login/login_page.dart';

part 'routes.g.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  LoginRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: LoginPage());
}

@TypedShellRoute<HomeRoute>(routes: [
  TypedGoRoute<UsersRoute>(path: '/users'),
  TypedGoRoute<PlacesRoute>(path: '/places'),
  TypedGoRoute<PlacesReviewsRoute>(path: '/places-reviews'),
])
class HomeRoute extends ShellRouteData {
  HomeRoute();

  @override
  Page<Function> pageBuilder(BuildContext context, GoRouterState state, Widget navigator) =>
      NoTransitionPage(child: HomePage(content: navigator));
}

class UsersRoute extends GoRouteData {
  UsersRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: UsersPage());
}

class PlacesRoute extends GoRouteData {
  PlacesRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: PlacesPage());
}

class PlacesReviewsRoute extends GoRouteData {
  PlacesReviewsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: PlacesReviewsPage());
}
