import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/components/image_header.dart';
import 'package:wedding_management/components/snakbar.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/models/rent_car.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/providers/rent_car_form_provider.dart';
import 'package:wedding_management/screens/dress_datail/components/product_tile.dart';
import 'package:wedding_management/services/rent_car_service.dart';
import 'package:wedding_management/size_config.dart';

class Body extends StatelessWidget {
  final String carId;
  const Body({Key? key, required this.carId}) : super(key: key);

  void onAddToCard(context, data) {
    Provider.of<CartProvider>(context, listen: false)
        .setRentCarDataFromDetail(
        id: data.id!,
        title: data.title,
        image: data.coverImage,
        price: data.rate.toString()
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar(text: 'Rent Car is added to Cart'));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RentCar>(
      future: RentCarService.getRentCar(carId),
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
                      const Text('Rate', style: TextStyle(color: kTextColor, fontSize: 18, fontWeight: FontWeight.w600),),
                      SizedBox(height: getProportionateScreenHeight(10),),
                      Text('${snapshot.data!.rate} is a rate of 1 days.', style: const TextStyle(color: kTextLightColor),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      const SizedBox(width: 40,),
                      Expanded(
                        flex: 1,
                          child: GradientButton(buttonText: 'ADD TO CART', onPressed: ()=> onAddToCard(context, snapshot.data!))
                      ),
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

                  const SizedBox(height: 100,),
                ],
              ),
            ),
        ],
      ),): const Text('no Data'),
    );
  }
}
