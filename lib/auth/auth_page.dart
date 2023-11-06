import 'package:flutter/material.dart';
import 'widgets/auth_body.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static const route = '/auth-page';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBody(),
    );
  }
}
