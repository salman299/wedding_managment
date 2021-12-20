import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/models/banquet.dart';
import 'package:wedding_management/providers/banquet_form_provider.dart';
import 'package:wedding_management/screens/banquet/components/banquet_card.dart';
import 'package:wedding_management/size_config.dart';

class SelectBanquetGrid extends StatelessWidget {
  final TextEditingController selectedBanquet, banquetName, image;
  SelectBanquetGrid({Key? key, required this.selectedBanquet, required this.banquetName, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Banquet>>(
      future: Provider.of<BanquetFormProvider>(context, listen: false).getBanquets(),
      builder: (BuildContext context, AsyncSnapshot<List<Banquet>> snapshot) {
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
            children: snapshot.data!.map((banquet) {
              return Consumer<BanquetFormProvider>(
                builder: (context, formProvider, child)=>BanquetCard(
                  id: banquet.id!,
                  title: banquet.name,
                  coverImage: banquet.coverImage,
                  addressArea: banquet.area,
                  minPackageRate: banquet.minRate,
                  isSelected: formProvider.banquetId==banquet.id!,
                  onClicked: (){
                    Provider.of<BanquetFormProvider>(context, listen: false).setBanquetId(banquet.id);
                    selectedBanquet.text=banquet.id!;
                    banquetName.text=banquet.name;
                    image.text=banquet.coverImage;
                  },
                ),
              );
            }).toList());
      },
    );
  }
}
