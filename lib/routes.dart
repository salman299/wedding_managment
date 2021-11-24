import 'package:flutter/widgets.dart';
import 'package:wedding_management/screens/banquet/banquet.dart';
import 'package:wedding_management/screens/banquet_detail/banquet_detail.dart';
import 'package:wedding_management/screens/home/home.dart';
import 'package:wedding_management/screens/register/register.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  BanquetDetail.routeName: (context) => const BanquetDetail(),
  Register.routeName: (context) => const Register(),
  Banquet.routeName: (context) => const Banquet(),
  Home.routeName: (context) => const Home(),
};
