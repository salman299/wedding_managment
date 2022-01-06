import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/providers/auth_provider.dart';
import 'package:wedding_management/providers/settings.dart';
import 'package:wedding_management/screens/account/account.dart';
import 'package:wedding_management/screens/cart/cart.dart';
import 'package:wedding_management/screens/category/category.dart';
import 'package:wedding_management/components/app_bar.dart';
import 'package:wedding_management/screens/home/components/bottom_navigation.dart';
import 'package:wedding_management/screens/progress/progress.dart';
import '../../size_config.dart';
import '../../constants.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final List<Widget> _widgetOptions = <Widget>[
    const Category(),
    const Progress(),
    const Account(),
    const Cart(),
  ];

  void _onItemTapped(int index) {
    Provider.of<AppSettings>(context, listen: false).setPageIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettings>(
      builder: (context, settings, chl) => Scaffold(
        appBar: CustomAppBar(title: menuItems[settings.pageIndex],),
        body: _widgetOptions.elementAt(settings.pageIndex),
        bottomNavigationBar: CustomBottomNavigationBar(currentItem: settings.pageIndex,onItemTapped: _onItemTapped,),
      ),
    );
  }
}