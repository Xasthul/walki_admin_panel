import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:walki_admin_panel/app/application_dependencies.dart';
import 'package:walki_admin_panel/app/utils/router/router.dart';

void main() {
  usePathUrlStrategy();
  runApp(const WalkiAdminPanel());
}

class WalkiAdminPanel extends StatelessWidget {
  const WalkiAdminPanel({super.key});

  @override
  Widget build(BuildContext context) => ApplicationDependencies(
        child: MaterialApp.router(
          routerConfig: router,
          title: 'Walki Admin Panel',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
              onPrimary: Colors.blue[700],
              primary: Colors.blue[700],
            ),
            checkboxTheme: CheckboxThemeData(
              checkColor: WidgetStateProperty.all(Colors.white),
            ),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
        ),
      );
}
