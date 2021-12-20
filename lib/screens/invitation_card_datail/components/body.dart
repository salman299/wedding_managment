import 'package:flutter/material.dart';
import 'package:wedding_management/components/image_header.dart';
import 'package:wedding_management/models/invitation_card.dart';
import 'package:wedding_management/components/title.dart';
import 'package:wedding_management/services/card_service.dart';
import 'package:wedding_management/size_config.dart';

class Body extends StatelessWidget {
  final String invitationCardId;
  const Body({Key? key, required this.invitationCardId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InvitationCard>(
      future: InvitationCardService.getCard(invitationCardId),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : snapshot.hasData ? Column(
                  children: [
                    ImageHeader(imagesUrl: snapshot.data!.images, placeholder: 'assets/categories/card.png', onClick: (){},),
                    SizedBox(height: getProportionateScreenHeight(15),),
                    TitleTile(title: snapshot.data!.title),
                  ],
                ): const Text('no Data'),
    );
  }
}
