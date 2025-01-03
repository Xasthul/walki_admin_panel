import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/app/utils/router/routes.dart';
import 'package:walki_admin_panel/app/utils/widget/after_layout.dart';
import 'package:walki_admin_panel/app/utils/widget/reaction_dispose.dart';
import 'package:walki_admin_panel/home/home_dependencies.dart';
import 'package:walki_admin_panel/home/store/home_store.dart';
import 'package:walki_admin_panel/home/utils/widget/navigation_bar_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) => HomeDependencies(
        child: _HomePageBase(content: content),
      );
}

class _HomePageBase extends StatefulWidget {
  const _HomePageBase({required this.content});

  final Widget content;

  @override
  State<_HomePageBase> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePageBase> with ReactionDispose, AfterLayout {
  final _store = getIt<HomeStore>();

  @override
  void afterFirstLayout(BuildContext context) => disposers.add(
        reaction(
          (_) => _store.isLoggedOutSuccessfully,
          (bool isLoggedOutSuccessfully) {
            if (isLoggedOutSuccessfully) {
              Router.neglect(
                context,
                () => LoginRoute().go(context),
              );
            }
          },
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            const NavigationBarComponent(),
            Expanded(
              child: widget.content,
            ),
          ],
        ),
      );
}
