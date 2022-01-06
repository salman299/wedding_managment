import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/size_config.dart';

import '../../../custom_icons_icons.dart';
class BanquetPackageCard extends StatelessWidget {
  final String title;
  final double price;
  final List<String> points;
  final bool isSelected;
  final VoidCallback? onClicked;
  final VoidCallback? onAddToCart;
  const BanquetPackageCard({Key? key, required this.title, required this.price, required this.points, this.isSelected=false, this.onClicked, this.onAddToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenHeight(10)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(color: kSelectedItemColor): null,
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ...points.map((e) =>
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            const Icon( Icons.star_border, size: 12, color: kSecondaryColor,),
                            const SizedBox(width: 10,),
                            Text(e, style: const TextStyle(color: kTextColor),),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
            if (onAddToCart != null)
            Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(label: const Text('Add'),icon: const Icon(CustomIcons.shopping_cart,), onPressed: onAddToCart,))
          ],
        ),
      ),
    );
  }
}
