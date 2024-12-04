import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("MainScreen")),
    );
  }
}