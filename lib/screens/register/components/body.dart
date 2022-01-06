import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/custom_container.dart';
import 'package:wedding_management/providers/auth_provider.dart';
import 'package:wedding_management/screens/register/components/form.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/screens/home/home.dart';
import 'package:wedding_management/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  TextEditingController confirmPassword = TextEditingController(text: '');
  TextEditingController country = TextEditingController(text: '');
  TextEditingController city = TextEditingController(text: '');

  bool isLoading = false;
  bool isLogin = true;

  void changeStatus() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void showErrorDialog(String message,[String upperMessage="An error Message"] ){
    showDialog(context: context,builder: (ctx) =>AlertDialog(title: Text(upperMessage),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text("Okay"),
          onPressed: ()=> Navigator.of(context).pop(),
        )
      ],)
    );
  }

  void onButtonPress(context) async {
    if (_formKey.currentState!.validate()){
      setState(() {
        isLoading = true;
      });
      try{
        if (isLogin){
          await Provider.of<Auth>(context, listen: false).signIn(email.text, password.text);
        } else {
          await Provider.of<Auth>(context, listen: false).signUp(email.text, password.text);
        }
        Navigator.of(context).pushReplacementNamed(Home.routeName);
      } catch (error){
        setState(() {
          isLoading = false;
        });
        showErrorDialog(error.toString());
      }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomContainer(
                height: isLogin ? 500 : 260,
              ),
              LoginForm(
                isLogin: isLogin,
                formKey: _formKey,
                email: email,
                password: password,
                confirmPassword: confirmPassword,
                country: country,
                city: city,
              ),
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30)),
                      child: GradientButton(
                          buttonText: isLogin ? "Login" : "Signup",
                          onPressed: () => onButtonPress(context))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isLogin
                          ? "Don't have an account?"
                          : "Already have an account?"),
                      TextButton(
                          onPressed: changeStatus,
                          child: Text(isLogin ? "Sign Up" : "Login"))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        if(isLoading)
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.5),
          child: const CircularProgressIndicator(),
        )
      ],
    );
  }
}
