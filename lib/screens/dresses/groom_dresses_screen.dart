import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import 'package:wedding_management/enums.dart';
import 'package:wedding_management/services/dress_service.dart';
import './components/body.dart';

class GroomDressesScreen extends StatelessWidget {
  static String routeName = "/groom_dresses_screen";
  const GroomDressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Groom Dresses"),
      body: Body(isGroomDresses: true),
    );
  }
}

