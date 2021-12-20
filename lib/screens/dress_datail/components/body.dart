import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/components/image_header.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/models/dress.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/screens/dress_datail/components/product_tile.dart';
import 'package:wedding_management/screens/dress_datail/components/quantity_change_tile.dart';
import 'package:wedding_management/screens/dress_datail/components/select_color.dart';
import 'package:wedding_management/screens/dress_datail/components/select_size.dart';
import 'package:wedding_management/services/dress_service.dart';
import 'package:wedding_management/size_config.dart';

class Body extends StatelessWidget {
  final String dressId;
  final bool isGroomDress;
  Body({Key? key, required this.dressId, required this.isGroomDress}) : super(key: key);
  int quantity=1;
  String color='';
  String size='';

  Future<Dress> getDress() async{
    final dress = isGroomDress? await DressService.getGroomDress(dressId) : await DressService.getBridalDress(dressId);
    color = dress.colors[0];
    size= dress.sizes[0];
    return dress;
  }

  void onChange({String? colorValue, String? sizeValue, int? quantityValue}){
    color=colorValue ?? color;
    size= sizeValue ?? size;
    quantity= quantityValue ?? quantity;
  }

  void onAddToCart(context, productId, price, title, image){
    Provider.of<CartProvider>(context, listen: false).addItem(productId, price, title, image, color, size, quantity);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Dress>(
      future: getDress(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : snapshot.hasData ? Column(
                  children: [
                    ImageHeader(imagesUrl: snapshot.data!.images, placeholder: 'assets/categories/dress.png', onClick: (){},),
                    SizedBox(height: getProportionateScreenHeight(15),),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          ProductTile(title: snapshot.data!.title, rate: snapshot.data!.rate),
                          const Text('Color', style: TextStyle(color: kTextColor, fontSize: 18),),
                          SelectColor(colors: snapshot.data!.colors.map((e) => Color(int.parse('0xFF$e'))).toList(),values: snapshot.data!.colors, onChanged: (value)=>onChange(colorValue: value)),
                          const SizedBox(height: 10,),
                          const Text('Size', style: TextStyle(color: kTextColor, fontSize: 18),),
                          SelectSize(sizes: snapshot.data!.sizes, onChanged: (value)=>onChange(sizeValue: value)),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: GradientButton(buttonText: 'ADD TO CART', onPressed: ()=>onAddToCart(context, snapshot.data!.id, snapshot.data!.rate, snapshot.data!.title, snapshot.data!.coverImage),)),
                              const SizedBox(width: 40,),
                              QuantityTile(initialValue: 1, onChange: (value)=>onChange(quantityValue: value),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          const Text('Description', style: TextStyle(color: kTextColor, fontSize: 18),),
                          SizedBox(height: getProportionateScreenHeight(10),),
                          Text(snapshot.data!.description, style: TextStyle(color: kTextLightColor),)
                        ],
                      ),
                    ),
                  ],
                ): const Text('no Data'),
    );
  }
}
