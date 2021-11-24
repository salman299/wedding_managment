import 'package:flutter/material.dart';
import 'package:wedding_management/size_config.dart';

import 'category_card.dart';

class Category {
  final String name;
  final String imageUrl;
  Category({required this.name, required this.imageUrl});
}

class CategoryGrid extends StatelessWidget {
  CategoryGrid({Key? key}) : super(key: key);
  final List<Category> categories = [
    Category(name: "Banquet", imageUrl: "assets/categories/banquet.png"),
    Category(name: "Card", imageUrl: "assets/categories/card.png"),
    Category(name: "dress", imageUrl: "assets/categories/dress.png"),
    Category(
        name: "Photographer", imageUrl: "assets/categories/photographer.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: getProportionateScreenWidth(20),
          mainAxisSpacing: getProportionateScreenWidth(20),
        ),
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        itemBuilder: (ctx, index) => CategoryCard(
              title: categories[index].name,
              image: categories[index].imageUrl,
            ));
  }
}
