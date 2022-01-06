import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/components/long_image_card.dart';
import 'package:wedding_management/screens/banquet_detail/banquet_detail.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:wedding_management/size_config.dart';

class BanquetGrid extends StatefulWidget {
  BanquetGrid({Key? key}) : super(key: key);

  @override
  State<BanquetGrid> createState() => _BanquetGridState();
}

class _BanquetGridState extends State<BanquetGrid> {
  final Stream<QuerySnapshot> _banquetStream = BanquetService.getStreamOfBanquets();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _banquetStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              Map<String, dynamic> banquet =
                  document.data()! as Map<String, dynamic>;
              return LongImageCard(
                id: document.id,
                title: banquet['name'],
                image: banquet['imageUrl'],
                subtitle: banquet['area'],
                price: banquet['minRate'],
                onClicked: ()=>Navigator.of(context).pushNamed(BanquetDetail.routeName, arguments: document.id ),
              );
            }).toList());
      },
    );
  }
}
