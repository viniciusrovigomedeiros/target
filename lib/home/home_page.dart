import 'package:flutter/material.dart';
import 'package:targettest/home/widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
