import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import './components/body.dart';
class PhotographerScreen extends StatelessWidget {
  static String routeName = "/photographer";
  const PhotographerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Photographer"),
      body: Body(),
    );
  }
}

