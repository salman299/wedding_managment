import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import './components/body.dart';
class Banquet extends StatelessWidget {
  static String routeName = "/banquet";
  const Banquet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Banquet"),
      body: Body(),
    );
  }
}

