import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import '../size_config.dart';

class TitleTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String ending;

  const TitleTile({
    Key? key,
    required this.title,
    this.subtitle='',
    this.ending='',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(subtitle, style: const TextStyle(fontSize: 16, color: kTextLightColor))
              )
            ]),
      ],
    );
  }
}