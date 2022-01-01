import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/screens/banquet_detail/components/banquet_packages.dart';
import 'package:wedding_management/components/title.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:wedding_management/size_config.dart';
import '../../../components/image_header.dart';
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
              ? const Center(child: CircularProgressIndicator())
              : snapshot.hasData ? Column(
                  children: [
                    ImageHeader(imagesUrl: snapshot.data!.images, placeholder: 'assets/categories/banquet.png', onClick: (){},),
                    SizedBox(height: getProportionateScreenHeight(15),),
                    TitleTile(title: snapshot.data!.name, subtitle: snapshot.data!.city),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    const Text('Packages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Expanded(child: BanquetPackages(banquetId: banquetId,))
                  ],
                ): const Text('no Data'),
    );
  }
}
