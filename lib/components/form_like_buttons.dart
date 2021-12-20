import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';
import '../constants.dart';

class FormLikeActionButtons extends StatefulWidget {
  final Function onToggle;
  const FormLikeActionButtons({Key? key, required this.onToggle}) : super(key: key);

  @override
  State<FormLikeActionButtons> createState() => _FormLikeActionButtonsState();
}

class _FormLikeActionButtonsState extends State<FormLikeActionButtons> {
  bool isLiked = false;

  onToggle(){
    setState(() {
      isLiked = !isLiked;
    });
    widget.onToggle(isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(35),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(33), bottomLeft: Radius.circular(33))),
              ),
              onPressed: (){
                if (isLiked) {
                  onToggle();
                }
              },
              child: Ink(
                decoration: BoxDecoration(
                    color: isLiked ? null : kBackgroundColor,
                    gradient: isLiked ? kPrimaryGradientColor : null,
                    border: isLiked ? null : Border.all(color: kSecondaryColor),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(33), bottomLeft: Radius.circular(33))),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500.0, minHeight: 40.0),
                  alignment: Alignment.center,
                  child: Text(
                    'All',
                    textAlign: TextAlign.center,
                    style: isLiked ? const TextStyle(color: Colors.white) : const TextStyle(color: kSecondaryColor),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(33), bottomRight: Radius.circular(33))),
              ),
              onPressed: (){
                if (isLiked) {
                  onToggle();
                }
              },
              child: Ink(
                decoration: BoxDecoration(
                    color: !isLiked ? null : kBackgroundColor,
                    gradient: !isLiked ? kPrimaryGradientColor : null,
                    border: !isLiked ? null : Border.all(color: kSecondaryColor),
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(33), bottomRight: Radius.circular(33))),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500.0, minHeight: 40.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Liked',
                    textAlign: TextAlign.center,
                    style: !isLiked ? const TextStyle(color: Colors.white) : const TextStyle(color: kSecondaryColor),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
