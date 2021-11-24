import 'package:flutter/material.dart';
import 'package:wedding_management/size_config.dart';

import 'progress_card.dart';

class Progress{
  final String name;
  final double percentage;
  Progress({ required this.name, required this.percentage});
}

class ProgressList extends StatelessWidget {
  ProgressList({Key? key}) : super(key: key);
  final List<Progress> categories = [
    Progress(name: 'Banquet', percentage: 0.20),
    Progress(name: 'Card', percentage: 0.20),
    Progress(name: 'Dress', percentage: 0.20),
    Progress(name: 'Photographer', percentage: 0.20),
    Progress(name: 'Photographer', percentage: 0.20),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        itemBuilder: (ctx, index) => ProgressCard(
              title: categories[index].name,
              percentage: categories[index].percentage,
            ));
  }
}
