import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import './components/body.dart';
class BanquetForm extends StatelessWidget {
  static String routeName = "/banquet_form";
  const BanquetForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "DashBoard",),
      body: Body(),
    );
  }
}

