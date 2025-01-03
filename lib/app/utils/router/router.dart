import 'package:go_router/go_router.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/app/utils/router/routes.dart';
import 'package:walki_admin_panel/app/utils/storage/local_storage.dart';

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: LoginRoute().location,
  redirect: (context, state) async {
    final localStorage = getIt<LocalStorage>();
    final accessToken = await localStorage.accessToken;
    final loginRouteLocation = LoginRoute().location;

    // if not logged in
    if (accessToken == null) {
      return loginRouteLocation;
    }
    // if logged in, but on login page
    if (state.matchedLocation == loginRouteLocation) {
      return UsersRoute().location;
    }
    return null;
  },
);
