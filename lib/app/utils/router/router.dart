import 'package:go_router/go_router.dart';
import 'package:walki_admin_panel/app/utils/router/routes.dart';

final router = GoRouter(
  routes: $appRoutes,
  redirect: (context, state) {
    final loginRouteLocation = LoginRoute().location;

    // if not logged in
    if (1 == 1) {
      return loginRouteLocation;
    }
    // if logged in, but on login page
    if (state.matchedLocation == loginRouteLocation) {
      return UsersRoute().location;
    }
    return null;
  },
);
