import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/models/invitation_card.dart';
import 'package:wedding_management/providers/invitation_card_form_provider.dart';
import 'package:wedding_management/components/short_image_card.dart';
import 'package:wedding_management/size_config.dart';

class SelectInvitationCardGrid extends StatelessWidget {
  final TextEditingController invitationCardId, cardTitle, image, price;
  const SelectInvitationCardGrid({Key? key, required this.invitationCardId,required this.cardTitle,required this.image,required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<InvitationCard>>(
      future: Provider.of<InvitationCardFormProvider>(context, listen: false).getInvitationCards(),
      builder: (BuildContext context, AsyncSnapshot<List<InvitationCard>> snapshot) {
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
            children: snapshot.data!.map((card) {
              return Consumer<InvitationCardFormProvider>(
                builder: (context, formProvider, child)=> ShortImageCard(
                    id: card.id!,
                    title: card.title,
                    coverImage: card.coverImage,
                    rate: card.rate.toString(),
                    isSelected: formProvider.invitationCardId == card.id!,
                    onClicked: (){
                      Provider.of<InvitationCardFormProvider>(context, listen: false).setInvitationCardId(card.id);
                      invitationCardId.text = card.id!;
                      cardTitle.text = card.title;
                      image.text = card.coverImage;
                      price.text = card.rate.toString();
                    })
              );
            }).toList());
      },
    );
  }
}
