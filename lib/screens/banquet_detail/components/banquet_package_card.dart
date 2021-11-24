import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/custom_icons_icons.dart';
import 'package:wedding_management/size_config.dart';
class BanquetPackageCard extends StatelessWidget {
  final String title;
  final double price;
  final List<String> points;
  const BanquetPackageCard({Key? key, required this.title, required this.price, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenHeight(10)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.16),
          blurRadius: 6,
          offset: Offset.zero,
        ),]
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
              Text(price.toString(), style: const TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w600),)
            ],
          ),
          const SizedBox(height: 10,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ...points.map((e) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          const Icon( CustomIcons.plus, size: 10, color: kSecondaryColor,),
                          const SizedBox(width: 10,),
                          Text(e, style: const TextStyle(color: kTextLightColor, fontWeight: FontWeight.w600),),
                        ],
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
