import 'package:flutter/material.dart';
import 'package:wedding_management/screens/banquet/banquet.dart';
import 'package:wedding_management/screens/dresses/bridal_dresses_screen.dart';
import 'package:wedding_management/screens/dresses/groom_dresses_screen.dart';
import 'package:wedding_management/screens/invitation_card/invitation_card_screen.dart';
import 'package:wedding_management/screens/photographer/photographer.dart';
import 'package:wedding_management/screens/rent_car/rent_car.dart';
import 'package:wedding_management/size_config.dart';

import 'category_card.dart';

class Category {
  final String name;
  final String imageUrl;
  final String route;
  Category({required this.name, required this.imageUrl, required this.route});
}

class CategoryGrid extends StatelessWidget {
  CategoryGrid({Key? key}) : super(key: key);
  final List<Category> categories = [
    Category(name: "Banquet", imageUrl: "assets/categories/banquet.png", route:  Banquet.routeName),
    Category(name: "Card", imageUrl: "assets/categories/card.png", route: InvitationCardScreen.routeName),
    Category(name: "Bridal Dress", imageUrl: "assets/categories/dress.png", route: BridalDressesScreen.routeName),
    Category(name: "Groom Dress", imageUrl: "assets/categories/dress.png", route: GroomDressesScreen.routeName),
    Category(name: "Photographer", imageUrl: "assets/categories/photographer.png", route: PhotographerScreen.routeName),
    Category(name: "Rent A Car", imageUrl: "assets/categories/car.png", route: RentCarScreen.routeName),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.99,
          crossAxisSpacing: getProportionateScreenWidth(20),
          mainAxisSpacing: getProportionateScreenWidth(20),
        ),
        padding:
            EdgeInsets.only(left: getProportionateScreenWidth(20),right: getProportionateScreenWidth(20), bottom: 100),
        itemBuilder: (ctx, index) => CategoryCard(
              title: categories[index].name,
              image: categories[index].imageUrl,
              onClick: ()=>Navigator.of(context).pushNamed(categories[index].route),
            ));
  }
}
