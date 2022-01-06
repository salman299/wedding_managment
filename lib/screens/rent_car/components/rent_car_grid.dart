import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/components/short_image_card.dart';
import 'package:wedding_management/models/rent_car.dart';
import 'package:wedding_management/screens/rent_car_detail/rent_car_detail.dart';
import 'package:wedding_management/services/rent_car_service.dart';
import 'package:wedding_management/size_config.dart';

class RentCarGrid extends StatefulWidget {
  RentCarGrid({Key? key}) : super(key: key);

  @override
  State<RentCarGrid> createState() => _RentCarGridState();
}

class _RentCarGridState extends State<RentCarGrid> {
  final Stream<QuerySnapshot> _stream = RentCarService.getStreamOfRentCars();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              RentCar car = RentCar.fromMap(document.data() as Map<String, dynamic>, document.id);
              return ShortImageCard(
                id: car.id!,
                title: car.title,
                coverImage: car.coverImage,
                rate: car.rate.toString(),
                onClicked: ()=>{
                  Navigator.of(context).pushNamed(RentCarDetail.routeName, arguments: car.id!)
                },
              );
            }).toList());
      },
    );
  }
}
