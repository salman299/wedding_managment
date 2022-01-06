import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/models/cart_item.dart';
import 'package:wedding_management/size_config.dart';

class PackageItemTile extends StatelessWidget {
  final CartPackageItem cartItem;
  final String route;
  final VoidCallback onDelete;
  const PackageItemTile({Key? key, required this.route, required this.cartItem, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Container(
                height: 120,
                color: Colors.black12,
                child: CachedNetworkImage(
                  imageUrl: cartItem.image,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Opacity(
                    child: Center(child: Icon(Icons.image)),
                    opacity: 0.5,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.title,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              cartItem.subtitle,
                              style: const TextStyle(
                                  fontSize: 14, color: kTextLightColor),
                            ),
                          ],
                        ),
                        Text(
                          cartItem.price !=null ? '${cartItem.price! / 1000}K' : 'NA',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            runSpacing: 5,
                            children: [
                              Text(
                                '${(cartItem.percentage*100).toInt()}% Complete',
                                style: const TextStyle(
                                    fontSize: 14, color: kTextLightColor),
                              ),
                              Container(
                                width: double.infinity,
                                height: 7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: kTextLightColor,
                                ),
                                child: FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: cartItem.percentage,
                                  child: Container(
                                    height: 7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: kSecondaryLightColor,
                                    ),
                                  ),
                                ),
                              ),
                             GestureDetector(
                               onTap: ()=>Navigator.of(context).pushNamed(route),
                                 child: Text(cartItem.percentage==1 ? 'UPDATE' : 'COMPLETE' , style: const TextStyle(color: kPrimaryColor),)),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              color: kPrimaryColor,
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.black,
                              ),
                              onPressed: onDelete,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
