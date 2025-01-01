import 'package:flutter/material.dart';
import 'package:walki_admin_panel/home/home_page.dart';

void main() {
  runApp(const WalkiAdminPanel());
}

class WalkiAdminPanel extends StatelessWidget {
  const WalkiAdminPanel({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Walki Admin Panel',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      );
}
