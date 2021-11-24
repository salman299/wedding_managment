import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';

import '../size_config.dart';
class GradientButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  const GradientButton({Key? key, required this.buttonText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(55),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () => onPressed(),
        child: Ink(
          decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
