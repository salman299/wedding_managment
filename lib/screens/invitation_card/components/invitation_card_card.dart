import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';

class InvitationCardCard extends StatelessWidget {
  final String id;
  final String title;
  final String coverImage;
  final String rate;
  final Function onClicked;
  final bool isSelected;
  const InvitationCardCard(
      {Key? key,
        required this.id,
        required this.title,
        required this.coverImage,
        required this.rate,
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
                border: isSelected? Border.all(color: kSelectedItemColor): null,
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
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(23), topRight: Radius.circular(23)),
                      child: CachedNetworkImage(
                        imageUrl: coverImage,
                        fit: BoxFit.fitHeight,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 10,
              top: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(33),
                ),
                child: Text('${rate}'),
              )
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




