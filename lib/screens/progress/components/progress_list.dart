import 'package:flutter/material.dart';
import 'package:wedding_management/screens/banquet_form/banquet_form.dart';
import 'package:wedding_management/screens/dress_form/bridal_dress_form.dart';
import 'package:wedding_management/screens/dress_form/groom_dress_form.dart';
import 'package:wedding_management/screens/invitation_card_form/invitation_card_form.dart';
import 'package:wedding_management/size_config.dart';

import 'progress_card.dart';

class Progress{
  final String name;
  final double percentage;
  final String route;
  Progress({ required this.name, required this.percentage, required this.route});
}

class ProgressList extends StatelessWidget {
  ProgressList({Key? key}) : super(key: key);
  final List<Progress> categories = [
    Progress(name: 'Banquet', percentage: 0.20, route: BanquetForm.routeName),
    Progress(name: 'Card', percentage: 0.20, route: InvitationCardForm.routeName),
    Progress(name: 'Bridal Dress', percentage: 0.20, route: BridalDressForm.routeName),
    Progress(name: 'Groom Dress', percentage: 0.20, route: GroomDressForm.routeName),
    Progress(name: 'Photographer', percentage: 0.20, route: BanquetForm.routeName),
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
              onClick: ()=>Navigator.of(context).pushNamed(categories[index].route),
            ));
  }
}
