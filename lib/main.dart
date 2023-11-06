import 'package:flutter/material.dart';
import 'package:targettest/auth/auth_page.dart';
import 'package:targettest/core/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Target test',
      initialRoute: AuthPage.route,
      routes: appRoutes,
    );
  }
}
