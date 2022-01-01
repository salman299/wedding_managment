import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import './components/body.dart';
class RentCarForm extends StatelessWidget {
  static String routeName = "/rent_car_form";
  const RentCarForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Rent Car Form",),
      body: Body(),
    );
  }
}

