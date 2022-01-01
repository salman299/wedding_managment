import 'package:flutter/material.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/components/outline_button.dart';
import '../../register/register.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/wedding.png',
            height: 100,
          ),
          Column(
            children: const [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10,),
              Text(
                'We welcome you to our online wedding management portal. You should have an account to order items from our application.',
                style: TextStyle(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              GradientButton(buttonText: 'Login',onPressed: ()=>Navigator.of(context).pushNamed(Register.routeName),isCircular: false,),
              const SizedBox(height: 10,),
              CustomOutlineButton(buttonText: 'Signup',onPressed: ()=>Navigator.of(context).pushNamed(Register.routeName),isCircular: false,),
            ],
          )
        ],
      ),
    );
  }
}
