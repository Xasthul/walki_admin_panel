import 'package:go_router/go_router.dart';

class NoTransitionPage extends CustomTransitionPage {
  NoTransitionPage(GoRouterState state, {required super.child})
      : super(
          key: state.pageKey,
          transitionsBuilder: (_, __, ___, child) => child,
          reverseTransitionDuration: Duration.zero,
          transitionDuration: Duration.zero,
        );
}
