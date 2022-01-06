import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/models/dress.dart';
import 'package:wedding_management/screens/dress_datail/bridal_dress_detail.dart';
import 'package:wedding_management/screens/dress_datail/groom_dress_detail.dart';
import 'package:wedding_management/screens/dresses/components/dress_card.dart';
import 'package:wedding_management/services/dress_service.dart';
import 'package:wedding_management/size_config.dart';


class DressesGrid extends StatelessWidget {
  final bool isGroomDresses;
  const DressesGrid({Key? key, required this.isGroomDresses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: isGroomDresses ? DressService.getStreamOfGroomDresses() : DressService.getStreamOfBridalDresses(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: getProportionateScreenWidth(20),
              mainAxisSpacing: getProportionateScreenWidth(20),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Dress dress = Dress.fromMap(document.data() as Map<String, dynamic>, document.id);
              return DressCard(
                id: dress.id!,
                title: dress.title,
                subtitle: dress.brand,
                coverImage: dress.coverImage,
                rate: dress.rate.toString(),
                onClicked: (){
                  if (isGroomDresses){
                    Navigator.of(context).pushNamed(GroomDressDetail.routeName, arguments: dress.id!);
                  } else {
                    Navigator.of(context).pushNamed(BridalDressDetail.routeName, arguments: dress.id!);
                  }
                }
              );
            }).toList());
      },
    );
  }
}
