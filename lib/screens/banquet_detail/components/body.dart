import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/screens/banquet_detail/components/banquet_packages.dart';
import 'package:wedding_management/screens/banquet_detail/components/title.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:wedding_management/size_config.dart';
import 'image_header.dart';
import '../../../models/banquet.dart';

class Body extends StatelessWidget {
  final String banquetId;
  const Body({Key? key, required this.banquetId}) : super(key: key);

  Future<Banquet?> getBanquet() async {
     return BanquetService.getBanquet(banquetId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Banquet?>(
      future: getBanquet(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const CircularProgressIndicator()
              : snapshot.hasData ? Column(
                  children: [
                    ImageHeader(imagesUrl: snapshot.data!.images),
                    SizedBox(height: getProportionateScreenHeight(15),),
                    TitleTile(title: snapshot.data!.name, location: snapshot.data!.city, press: (){}),
                    SizedBox(height: getProportionateScreenHeight(15),),
                    Expanded(child: BanquetPackages(banquetId: banquetId,))
                  ],
                ): const Text('no Data'),
    );
  }
}
