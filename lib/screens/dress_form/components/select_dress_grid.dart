import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/models/dress.dart';
import 'package:wedding_management/providers/dress_form_provider.dart';
import 'package:wedding_management/screens/dresses/components/dress_card.dart';
import 'package:wedding_management/size_config.dart';

class SelectDressGrid extends StatelessWidget {
  final TextEditingController dressId;
  final bool isGroomDress;
  const SelectDressGrid(
      {Key? key, required this.dressId, required this.isGroomDress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Dress>>(
      future: (isGroomDress
          ? Provider.of<DressFormProvider>(context, listen: false)
              .gerGroomDresses()
          : Provider.of<DressFormProvider>(context, listen: false)
              .gerBridalDresses()),
      builder: (BuildContext context, AsyncSnapshot<List<Dress>> snapshot) {
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
            children: snapshot.data!.map((dress) {
              return Consumer<DressFormProvider>(
                  builder: (context, formProvider, child) => DressCard(
                      id: dress.id!,
                      title: dress.title,
                      subtitle: dress.brand,
                      coverImage: dress.coverImage,
                      rate: dress.rate.toString(),
                      isSelected: (formProvider.bridalDressId == dress.id!) ||
                          (formProvider.groomDressId == dress.id!),
                      onClicked: () {
                        if (isGroomDress) {
                          Provider.of<DressFormProvider>(context, listen: false)
                              .setGroomDressId(dress.id);
                        } else {
                          Provider.of<DressFormProvider>(context, listen: false)
                              .setBridalDressId(dress.id);
                        }
                        dressId.text = dress.id!;
                      }));
            }).toList());
      },
    );
  }
}
