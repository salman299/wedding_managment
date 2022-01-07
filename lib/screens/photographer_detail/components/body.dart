import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/components/image_header.dart';
import 'package:wedding_management/components/outline_button.dart';
import 'package:wedding_management/components/snakbar.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/models/invitation_card.dart';
import 'package:wedding_management/models/photographer.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/providers/photographer_form_provider.dart';
import 'package:wedding_management/screens/dress_datail/components/product_tile.dart';
import 'package:wedding_management/services/card_service.dart';
import 'package:wedding_management/services/photographer_service.dart';
import 'package:wedding_management/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatelessWidget {
  final String photographerId;
  const Body({Key? key, required this.photographerId}) : super(key: key);

  void _launchSocial(String url, String fallbackUrl) async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)
    try {
      bool launched =
      await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }

  void onAddToCard(context, data) {
    Provider.of<CartProvider>(context, listen: false)
        .setPhotographerDataFromDetail(
        id: data.id!,
        title: data.title,
        image: data.coverImage,
        price: data.rate.toString()
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar(text: 'Photographer is added to Cart'));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Photographer>(
      future: PhotographerService.getPhotographer(photographerId),
      builder: (context, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? const Center(child: CircularProgressIndicator())
          : snapshot.hasData
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      ImageHeader(
                        imagesUrl: snapshot.data!.images,
                        placeholder: 'assets/categories/dress.png',
                        onClick: () {},
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Wrap(
                          runSpacing: 15,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            ProductTile(
                                title: snapshot.data!.title,
                                rate: snapshot.data!.rate),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Rate',
                                  style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Text(
                                  '${snapshot.data!.rate} is a rate of 1 photographer for an 1 hour. Rate will be multiple with the hours and the no of photographers you need for your wedding.',
                                  style:
                                      const TextStyle(color: kTextLightColor),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: CustomOutlineButton(
                                  buttonText: 'GO TO FACEBOOK',
                                  onPressed: () => _launchSocial('fb://profile/408834569303957',snapshot.data!.facebookLink),
                                )),
                                const SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                    child: GradientButton(
                                        buttonText: 'ADD TO CART',
                                        onPressed: ()=>onAddToCard(context, snapshot.data!))),
                                // QuantityTile(initialValue: 1, onChange: (value)=>onChange(quantityValue: value),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Description',
                                  style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Text(
                                  snapshot.data!.description,
                                  style:
                                      const TextStyle(color: kTextLightColor),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                ...snapshot.data!.details.map((e) => Text(
                                      '- ' + e,
                                      style: const TextStyle(
                                          color: kTextLightColor),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const Text('no Data'),
    );
  }
}
