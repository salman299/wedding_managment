import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/short_image_card.dart';
import 'package:wedding_management/models/rent_car.dart';
import 'package:wedding_management/providers/rent_car_form_provider.dart';
import 'package:wedding_management/size_config.dart';

class SelectRentCarGrid extends StatelessWidget {
  final TextEditingController rentCarId, title, image, price;
  const SelectRentCarGrid({Key? key, required this.rentCarId,required this.title,required this.image,required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RentCar>>(
      future: Provider.of<RentCarFormProvider>(context, listen: false).getRentCars(),
      builder: (BuildContext context, AsyncSnapshot<List<RentCar>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: getProportionateScreenWidth(20),
              mainAxisSpacing: getProportionateScreenWidth(20),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            children: snapshot.data!.map((car) {
              return Consumer<RentCarFormProvider>(
                builder: (context, formProvider, child)=> ShortImageCard(
                    id: car.id!,
                    title: car.title,
                    coverImage: car.coverImage,
                    rate: car.rate.toString(),
                    isSelected: formProvider.rentCarId == car.id!,
                    onClicked: (){
                      Provider.of<RentCarFormProvider>(context, listen: false).setRentCarId(car.id);
                      rentCarId.text = car.id!;
                      title.text = car.title;
                      image.text = car.coverImage;
                      price.text = car.rate.toString();
                    })
              );
            }).toList());
      },
    );
  }
}
