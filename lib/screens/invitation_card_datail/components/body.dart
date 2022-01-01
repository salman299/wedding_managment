import 'package:flutter/material.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/components/image_header.dart';
import 'package:wedding_management/components/outline_button.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/models/invitation_card.dart';
import 'package:wedding_management/screens/dress_datail/components/product_tile.dart';
import 'package:wedding_management/services/card_service.dart';
import 'package:wedding_management/size_config.dart';

class Body extends StatelessWidget {
  final String invitationCardId;
  const Body({Key? key, required this.invitationCardId}) : super(key: key);

  void addToCart(){

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InvitationCard>(
      future: InvitationCardService.getCard(invitationCardId),
      builder: (context, snapshot) =>
      snapshot.connectionState == ConnectionState.waiting
          ? const Center(child: CircularProgressIndicator())
          : snapshot.hasData ? SingleChildScrollView(
            child: Column(
        children: [
            ImageHeader(imagesUrl: snapshot.data!.images, placeholder: 'assets/categories/dress.png', onClick: (){},),
            SizedBox(height: getProportionateScreenHeight(15),),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                runSpacing: 15,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  ProductTile(title: snapshot.data!.title, rate: snapshot.data!.rate),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Packages', style: TextStyle(color: kTextColor, fontSize: 18, fontWeight: FontWeight.w600),),
                      SizedBox(height: getProportionateScreenHeight(10),),
                      Text('The card contains ${snapshot.data!.packs} packs', style: const TextStyle(color: kTextLightColor),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Description', style: TextStyle(color: kTextColor, fontSize: 18, fontWeight: FontWeight.w600),),
                      SizedBox(height: getProportionateScreenHeight(10),),
                      Text(snapshot.data!.description, style: const TextStyle(color: kTextLightColor),),
                      SizedBox(height: getProportionateScreenHeight(10),),
                      ...snapshot.data!.details.map((e) => Text('- ' +e, style: const TextStyle(color: kTextLightColor),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Expanded(child: CustomOutlineButton(buttonText: 'GO TO FACEBOOK', onPressed: ()=>{},)),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      const SizedBox(width: 40,),
                      Expanded(flex: 1, child: GradientButton(buttonText: 'ADD TO CART', onPressed: ()=>{})),
                      // QuantityTile(initialValue: 1, onChange: (value)=>onChange(quantityValue: value),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
        ],
      ),): const Text('no Data'),
    );
  }
}
