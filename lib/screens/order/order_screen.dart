import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import '../../size_config.dart';
import './components/body.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = "/order_screen";
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      appBar: CustomAppBar(title: "Orders",),
      body: Body(),
    );
  }
}

