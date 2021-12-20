import 'package:flutter/material.dart';
import './components/body.dart';
class Dump extends StatelessWidget {
  static String routeName = "/dump";
  const Dump({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

