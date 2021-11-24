import 'package:flutter/material.dart';
import 'package:wedding_management/screens/register/components/body.dart';

import '../../size_config.dart';
class Register extends StatelessWidget {
  static String routeName = "/register";
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}

