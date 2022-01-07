import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/screens/banquet_form/banquet_form.dart';
import 'package:wedding_management/screens/dress_form/bridal_dress_form.dart';
import 'package:wedding_management/screens/dress_form/groom_dress_form.dart';
import 'package:wedding_management/screens/invitation_card_form/invitation_card_form.dart';
import 'package:wedding_management/screens/photographer_form/invitation_card_form.dart';
import 'package:wedding_management/screens/rent_car_form/rent_car_form.dart';
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
  @override
  Widget build(BuildContext context) {
    final percentage = Provider.of<CartProvider>(context).getPercentage();
    final List<Progress> categories = [
      Progress(name: 'Banquet', percentage: percentage['banquet'] ?? 0, route: BanquetForm.routeName),
      Progress(name: 'Card', percentage: percentage['invitation_card'] ?? 0, route: InvitationCardForm.routeName),
      Progress(name: 'Photographer', percentage: percentage['photographer'] ?? 0, route: PhotographerForm.routeName),
      Progress(name: 'Rent a Car', percentage: percentage['car'] ?? 0, route: RentCarForm.routeName),
    ];
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
