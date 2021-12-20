import 'package:flutter/material.dart';
import 'package:wedding_management/screens/category/components/combine_progress_card.dart';
import 'category_grid.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CombineProgressCard(title: 'Wedding Planner Setup?', percentage: 0.50),
        Expanded(
          child: CategoryGrid(),
        ),
      ],
    );
  }
}
