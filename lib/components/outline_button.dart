import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';

import '../size_config.dart';
class CustomOutlineButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final bool isCircular;
  const CustomOutlineButton({Key? key, required this.buttonText, required this.onPressed, this.isCircular=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(55),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kBackgroundColor,
          padding: const EdgeInsets.all(0),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(isCircular ? 33: 10)),
        ),
        onPressed: () => onPressed(),
        child: Ink(
          decoration: BoxDecoration(
              border: Border.all(color: kSecondaryColor),
              borderRadius: BorderRadius.circular(isCircular ? 33: 10)
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: kSecondaryColor
              ),
            ),
          ),
        ),
      ),
    );
  }
}
