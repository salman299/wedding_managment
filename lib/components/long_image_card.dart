import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';

class LongImageCard extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final String subtitle;
  final String price;
  final Function onClicked;
  final bool isSelected;
  const LongImageCard(
      {Key? key,
        required this.id,
        required this.title,
        required this.image,
        required this.subtitle,
        required this.price,
        required this.onClicked,
        this.isSelected=false,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onClicked(),
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: isSelected? Border.all(color: Colors.greenAccent): null,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: const Offset(0, 3),
                      blurRadius: 6)
                ],
                borderRadius: BorderRadius.circular(23)),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(23), topRight: Radius.circular(23)),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Opacity(
                          child: Center(child: Icon(Icons.image)),
                          opacity: 0.5,
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 100),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            title.toUpperCase(),
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            subtitle.toUpperCase(),
                            style: const TextStyle(
                                color: kTextLightColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if ( isSelected )
          const Positioned(
            top: 10,
              left: 10,
              child: Icon(Icons.check_circle, color: kSelectedItemColor,size: 30,)
          ),
        ],
      ),
    );
  }
}




