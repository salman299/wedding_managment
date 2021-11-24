import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/screens/banquet_detail/banquet_detail.dart';

class BanquetCard extends StatelessWidget {
  final String id;
  final String title;
  final String coverImage;
  final String addressArea;
  final String minPackageRate;
  const BanquetCard(
      {Key? key,
        required this.id,
        required this.title,
      required this.coverImage,
      required this.addressArea,
      required this.minPackageRate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{Navigator.of(context).pushNamed(BanquetDetail.routeName, arguments: id )},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
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
                    imageUrl: coverImage,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const CircularProgressIndicator(),
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
                        addressArea.toUpperCase(),
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
    );
  }
}
