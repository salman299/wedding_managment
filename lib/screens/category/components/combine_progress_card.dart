import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/size_config.dart';

class CombineProgressCard extends StatelessWidget {
  final String title;
  final double percentage;
  const CombineProgressCard(
      {Key? key, required this.title, required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double availableWidth = (SizeConfig.screenWidth! - 80) * 0.5;
    return Container(
      margin: EdgeInsets.only(
          bottom: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
          left: getProportionateScreenWidth(20)),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3),
            blurRadius: 6)
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 15),
          Text(
            '${(percentage * 100).round()}% Complete!',
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kTextLightColor),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    width: availableWidth,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFF8F8FA),
                    ),
                  ),
                  Container(
                    width: availableWidth * percentage,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kSecondaryColor,
                    ),
                  )
                ],
              ),
              const Text(
                'COMPLETE >',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
