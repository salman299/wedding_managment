import 'package:flutter/material.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/screens/home/home.dart';

import '../../../size_config.dart';

class LoginForm extends StatelessWidget {
  final bool isLogin;
  const LoginForm({Key? key, required this.isLogin}) : super(key: key);
  
  void onLogin(context){
    print("Hello");
    Navigator.of(context).pushNamed(Home.routeName);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30)),
      child: Wrap(
        runSpacing: getProportionateScreenHeight(10),
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(
              isLogin ? "Login" : "Sign Up",
              style: TextStyle(fontSize: getProportionateScreenWidth(35), fontWeight: FontWeight.w600)
          ),
          const TextField(
            decoration: InputDecoration(
                label: Text("User ID"), hintText: "Email"),
          ),
          const TextField(
            decoration: InputDecoration(
              label: Text("Password"),
              hintText: "Password",
            ),
          ),
          if (!isLogin)
          const TextField(
            decoration: InputDecoration(
              label: Text("Confirm Password"),
              hintText: "Password",
            ),
          ),
          if (!isLogin)
          const TextField(
            decoration: InputDecoration(
              label: Text("City"),
              hintText: "city",
            ),
          ),
          if (!isLogin)
          const TextField(
            decoration: InputDecoration(
              label: Text("Country"),
              hintText: "country",
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: Text(!isLogin ? "" : "forgot password?"),
            ),
          ),
          GradientButton(buttonText: isLogin? "Login" : "Signup", onPressed: () => onLogin(context)),
        ],
      ),
    );
  }
}
