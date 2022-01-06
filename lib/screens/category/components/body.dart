import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/screens/category/components/combine_progress_card.dart';
import 'category_grid.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CartProvider>(
          builder: (context, data, ch) {
            return CombineProgressCard(title: 'Wedding Planner Setup?', percentage: data.avgPackage);
          }
        ),
        Expanded(
          child: CategoryGrid(),
        ),
      ],
    );
  }
}
