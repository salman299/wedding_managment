import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/components/long_image_card.dart';
import 'package:wedding_management/components/short_image_card.dart';
import 'package:wedding_management/models/photographer.dart';
import 'package:wedding_management/screens/banquet_detail/banquet_detail.dart';
import 'package:wedding_management/screens/photographer_detail/photographer_detail.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:wedding_management/services/photographer_service.dart';
import 'package:wedding_management/size_config.dart';

class PhotographerGrid extends StatefulWidget {
  PhotographerGrid({Key? key}) : super(key: key);

  @override
  State<PhotographerGrid> createState() => _PhotographerGridState();
}

class _PhotographerGridState extends State<PhotographerGrid> {
  final Stream<QuerySnapshot> _stream = PhotographerService.getStreamOfPhotographers();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: getProportionateScreenWidth(20),
              mainAxisSpacing: getProportionateScreenWidth(20),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Photographer photographer = Photographer.fromMap(document.data() as Map<String, dynamic>, document.id);
              return ShortImageCard(
                id: photographer.id!,
                title: photographer.title,
                coverImage: photographer.coverImage,
                rate: photographer.rate.toString(),
                onClicked: ()=>{
                  Navigator.of(context).pushNamed(PhotographerDetail.routeName, arguments: photographer.id!)
                },
              );
            }).toList());
      },
    );
  }
}
