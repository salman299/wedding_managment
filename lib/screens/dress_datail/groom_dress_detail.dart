import 'package:flutter/material.dart';
import './components/body.dart';

class GroomDressDetail extends StatelessWidget {
  static String routeName = '/groom_dress_detail';
  const GroomDressDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String dressId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Body(dressId: dressId,isGroomDress: true,),
    );
  }
}
