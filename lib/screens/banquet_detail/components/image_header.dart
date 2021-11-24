import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wedding_management/size_config.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ImageHeader extends StatefulWidget {
  final List<String> imagesUrl;
  const ImageHeader({Key? key, required this.imagesUrl}) : super(key: key);
  @override
  _ImageHeaderState createState() => _ImageHeaderState();
}

class _ImageHeaderState extends State<ImageHeader> {
  int currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(440),
          decoration: widget.imagesUrl.isNotEmpty
              ? null
              : const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: ExactAssetImage("assets/hotel.png"),
                  ),
                ),
          child: PageView.builder(
            itemCount: widget.imagesUrl.length,
            onPageChanged: (val) {
              setState(() {
                currentIndexPage = val;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF707070),
                        offset: Offset(0.0, 3.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.imagesUrl[index],
                    placeholderFadeInDuration: const Duration(seconds: 2),
                    placeholder: (context, url) => Opacity(
                      child: Image.asset("assets/hotel-1.png"),
                      opacity: 0.5,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 30,
          child: widget.imagesUrl.isEmpty
              ? Container()
              : Container(
                  alignment: Alignment.center,
                  width: SizeConfig.screenWidth,
                  child: DotsIndicator(
                    dotsCount: widget.imagesUrl.length,
                    position: currentIndexPage.roundToDouble(),
                    decorator: DotsDecorator(
                      spacing: const EdgeInsets.all(2),
                      color: Colors.white,
                      activeColor: Colors.white,
                      size: const Size.square(8.0),
                      activeSize: const Size(32.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
