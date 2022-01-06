import 'package:flutter/material.dart';
import './components/body.dart';

class RentCarDetail extends StatelessWidget {
  static String routeName = '/rent_car_detail';
  const RentCarDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String carId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Body(carId: carId,),
    );
  }
}
