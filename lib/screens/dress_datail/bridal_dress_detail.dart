import 'package:flutter/material.dart';
import './components/body.dart';

class BridalDressDetail extends StatelessWidget {
  static String routeName = '/bridal_dress_detail';
  const BridalDressDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String dressId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Body(dressId: dressId,isGroomDress: false,),
    );
  }
}
