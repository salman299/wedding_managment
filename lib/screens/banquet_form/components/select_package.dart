import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/providers/banquet_form_provider.dart';
import 'package:wedding_management/screens/banquet_detail/components/banquet_package_card.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:flutter/material.dart';
import '../../../models/banquet.dart';

class SelectBanquetPackages extends StatelessWidget {
  final String banquetId;
  final TextEditingController packageIdController, packageName, price;
  const SelectBanquetPackages({Key? key, required this.banquetId, required this.packageIdController, required this.packageName, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BanquetPackage>>(
      future: Provider.of<BanquetFormProvider>(context, listen: false).getBanquetPackages(banquetId),
      builder: (BuildContext context, AsyncSnapshot<List<BanquetPackage>> snapshot){
        if (snapshot.hasError) {
          return const Text('something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
            children: snapshot.data!.map((package) {
              return Consumer<BanquetFormProvider>(
                builder: (context, form, child) => BanquetPackageCard(
                  title: package.name,
                  price: package.rate,
                  points: package.points,
                  isSelected: form.banquetPackageId==package.id,
                  onClicked: (){
                      packageIdController.text = package.id!;
                      packageName.text = package.name;
                      price.text = package.rate.toString();
                      Provider.of<BanquetFormProvider>(context, listen: false).setBanquetPackageId(package.id);
                  },
                ),
              );
            }).toList());
      },
    );
  }
}
