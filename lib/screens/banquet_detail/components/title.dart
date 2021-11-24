import 'package:flutter/material.dart';
import '../../../size_config.dart';
import '../../../constants.dart';

class TitleTile extends StatelessWidget {
  const TitleTile({
    Key? key,
    required this.title,
    required this.location,
    required this.press,
  }) : super(key: key);

  final String? title;
  final String? location;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(location!, style: const TextStyle(fontSize: 18))
                )
              ]),
        ],
      ),
    );
  }
}