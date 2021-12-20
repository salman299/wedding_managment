import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_management/screens/banquet_detail/components/banquet_package_card.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:flutter/material.dart';
import '../../../models/banquet.dart';

class BanquetPackages extends StatelessWidget {
  final String banquetId;
  const BanquetPackages({Key? key, required this.banquetId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: BanquetService.getStreamOfBanquetServices(banquetId),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.hasError) {
          return const Text('something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              BanquetPackage package = BanquetPackage.fromMap(data, document.id);
              return BanquetPackageCard(
                  title: package.name,
                  price: package.rate,
                  points: package.points,
                  onClicked: (){},
              );
            }).toList());
      },
    );
  }
}
