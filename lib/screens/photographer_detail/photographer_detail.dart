import 'package:flutter/material.dart';
import './components/body.dart';

class PhotographerDetail extends StatelessWidget {
  static String routeName = '/photographer_detail';
  const PhotographerDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String photographerId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Body(photographerId: photographerId,),
    );
  }
}
