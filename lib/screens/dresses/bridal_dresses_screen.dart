import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import './components/body.dart';

class BridalDressesScreen extends StatelessWidget {
  static String routeName = "/bridal_dresses_screen";
  const BridalDressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Bridal Dresses"),
      body: Body(isGroomDresses: false),
    );
  }
}

