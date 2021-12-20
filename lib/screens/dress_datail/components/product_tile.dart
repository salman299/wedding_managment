import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductTile extends StatelessWidget {
  final String title;
  final double rate;
  const ProductTile({Key? key, required this.title, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        Text('${rate/1000}K', style: const TextStyle(fontSize: 24, color: kTextLightColor),),
      ],
    );
  }
}
