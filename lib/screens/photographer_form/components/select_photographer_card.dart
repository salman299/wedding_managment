import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/models/photographer.dart';
import 'package:wedding_management/components/short_image_card.dart';
import 'package:wedding_management/providers/photographer_form_provider.dart';
import 'package:wedding_management/size_config.dart';

class SelectPhotographerGrid extends StatelessWidget {
  final TextEditingController photographerId, title, image, price;
  const SelectPhotographerGrid({Key? key, required this.photographerId,required this.title,required this.image,required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photographer>>(
      future: Provider.of<PhotographerFormProvider>(context, listen: false).getPhotographers(),
      builder: (BuildContext context, AsyncSnapshot<List<Photographer>> snapshot) {
        if (snapshot.hasError) {
          return const Text('something went wrong');
        }
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
            children: snapshot.data!.map((photographer) {
              return Consumer<PhotographerFormProvider>(
                builder: (context, formProvider, child)=> ShortImageCard(
                    id: photographer.id!,
                    title: photographer.title,
                    coverImage: photographer.coverImage,
                    rate: photographer.rate.toString(),
                    isSelected: formProvider.photographerId == photographer.id!,
                    onClicked: (){
                      Provider.of<PhotographerFormProvider>(context, listen: false).setPhotographerId(photographer.id);
                      photographerId.text = photographer.id!;
                      title.text = photographer.title;
                      image.text = photographer.coverImage;
                      price.text = photographer.rate.toString();
                    })
              );
            }).toList());
      },
    );
  }
}
