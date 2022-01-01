import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import './components/body.dart';
class RentCarScreen extends StatelessWidget {
  static String routeName = "/rent_car";
  const RentCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Rent A Car"),
      body: Body(),
    );
  }
}

