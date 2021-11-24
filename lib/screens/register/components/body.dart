import 'package:flutter/material.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/components/custom_container.dart';
import 'package:wedding_management/screens/register/components/form.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLogin= true;

  void changeStatus(){
    setState(() {
      isLogin = !isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomContainer(height: isLogin ? 515 : 260,),
          LoginForm(isLogin: isLogin),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isLogin ? "Don't have an account?" : "Already have an account?"),
                TextButton(onPressed: changeStatus, child: Text(isLogin ? "Sign Up": "Login"))
            ],
          )
        ],
      ),
    );
  }
}
