import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:walki_admin_panel/app/utils/router/router.dart';

void main() {
  usePathUrlStrategy();
  runApp(const WalkiAdminPanel());
}

class WalkiAdminPanel extends StatelessWidget {
  const WalkiAdminPanel({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: router,
        title: 'Walki Admin Panel',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      );
}
