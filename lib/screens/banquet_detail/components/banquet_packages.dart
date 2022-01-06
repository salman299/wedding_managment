import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/snakbar.dart';
import 'package:wedding_management/providers/banquet_form_provider.dart';
import 'package:wedding_management/screens/banquet_detail/components/banquet_package_card.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:flutter/material.dart';
import '../../../models/banquet.dart';

class BanquetPackages extends StatelessWidget {
  final String banquetId;
  final String banquetName;
  final String image;
  const BanquetPackages({Key? key, required this.banquetId, required this.banquetName, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: BanquetService.getStreamOfBanquetServices(banquetId),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
            padding: EdgeInsets.zero,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              BanquetPackage package = BanquetPackage.fromMap(data, document.id);
              return BanquetPackageCard(
                  title: package.name,
                  price: package.rate,
                  points: package.points,
                  onAddToCart: () async {
                    await Provider.of<BanquetFormProvider>(context, listen: false).setBanquetDataFromDetail(id: banquetId, packageId: package.id!, image: image, banquetName: banquetName, packageName: package.name, price: package.rate.toString());
                    ScaffoldMessenger.of(context).showSnackBar(snackBar(text: 'Banquet is Added to Cart'));
                  },
              );
            }).toList());
      },
    );
  }
}
