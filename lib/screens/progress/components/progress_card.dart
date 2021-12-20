import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/screens/banquet_form/banquet_form.dart';
import 'package:wedding_management/size_config.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final double percentage;
  final VoidCallback onClick;
  const ProgressCard({Key? key, required this.title, required this.percentage, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double availableWidth = (SizeConfig.screenWidth! - 80) * 0.5;
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            Text(
              '${(percentage*100).round()}% Complete!',
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
                        color: kSecondaryLightColor,
                      ),
                    )
                  ],
                ),
                const Text(
                  'COMPLETE >',
                  style: TextStyle(
                      color: kSecondaryLightColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
