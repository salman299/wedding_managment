import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import './components/body.dart';
class GroomDressForm extends StatelessWidget {
  static String routeName = "/groom_dress_form";
  const GroomDressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Groom Dress",),
      body: Body(isGroomDress: true,),
    );
  }
}

