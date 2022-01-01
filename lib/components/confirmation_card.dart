import 'package:flutter/material.dart';
import 'package:wedding_management/components/gradient_button.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 44.0;
}

class ConfirmationCart extends StatelessWidget {
  final String title, description, buttonText;
  final Image? image;

  ConfirmationCart({
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: Consts.avatarRadius + Consts.padding,
              bottom: Consts.padding,
              left: Consts.padding,
              right: Consts.padding,
            ),
            margin: const EdgeInsets.only(top: Consts.avatarRadius),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 24.0),
                GradientButton(buttonText: buttonText, onPressed: ()=>Navigator.of(context).pop())
              ],
            ),
          ),
          Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: Consts.avatarRadius,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: Consts.avatarRadius-5,
                child: const FittedBox(
                    fit: BoxFit.fill,
                    child:Icon(Icons.check,size: 40,color: Colors.white,)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}