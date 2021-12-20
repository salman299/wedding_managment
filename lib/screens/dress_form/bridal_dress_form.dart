import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import './components/body.dart';
class BridalDressForm extends StatelessWidget {
  static String routeName = "/bridal_dress_form";
  const BridalDressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Bridal Dress",),
      body: Body(isGroomDress: false,),
    );
  }
}

