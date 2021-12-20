import 'package:flutter/material.dart';
import './components/body.dart';
class BanquetDetail extends StatelessWidget {
  static String routeName = '/banquet_details';
  const BanquetDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String banquetId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Body(banquetId: banquetId,),
    );
  }
}
