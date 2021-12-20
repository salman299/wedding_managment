import 'package:flutter/material.dart';
import '../../../size_config.dart';

class LoginForm extends StatelessWidget {
  final formKey;
  final TextEditingController email, password, confirmPassword, city, country;
  final bool isLogin;
  const LoginForm(
      {Key? key,
      required this.formKey,
      required this.isLogin,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.city,
      required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
      child: Form(
        key: formKey,
        child: Wrap(
          runSpacing: getProportionateScreenHeight(10),
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Text(isLogin ? "Login" : "Sign Up",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(35),
                    fontWeight: FontWeight.w600)),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                label: Text("User ID"),
                hintText: "Email",
              ),
              validator: (value){
                if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                  return "Email is non valid";
                }
              },
            ),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text("Password"),
                hintText: "Password",
              ),
              validator: (value){
                if (value!.length < 8) {
                  return "Password should contain more than 8 elements";
                }
              },
            ),
            if (!isLogin)
              TextFormField(
                controller: confirmPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text("Confirm Password"),
                  hintText: "Password",
                ),
                validator: (value){
                  if (value!=password.text){
                    return "Confirm Password is not same as password";
                  }
                },
              ),
            if (!isLogin)
              TextFormField(
                controller: city,
                decoration: const InputDecoration(
                  label: Text("City"),
                  hintText: "city",
                ),
              ),
            if (!isLogin)
              TextFormField(
                controller: country,
                decoration: const InputDecoration(
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
          ],
        ),
      ),
    );
  }
}
