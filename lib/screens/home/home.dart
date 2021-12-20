import 'package:flutter/material.dart';
import 'package:wedding_management/screens/account/account.dart';
import 'package:wedding_management/screens/cart/cart.dart';
import 'package:wedding_management/screens/category/category.dart';
import 'package:wedding_management/components/app_bar.dart';
import 'package:wedding_management/screens/home/components/bottom_navigation.dart';
import 'package:wedding_management/screens/progress/progress.dart';
import '../../size_config.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const Category(),
    const Progress(),
    const Account(),
    const Cart(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "DashBoard",),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomBottomNavigationBar(currentItem: _selectedIndex,onItemTapped: _onItemTapped,),
    );
  }
}