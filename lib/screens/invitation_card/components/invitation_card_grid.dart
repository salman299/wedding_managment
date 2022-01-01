import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedding_management/components/short_image_card.dart';
import 'package:wedding_management/screens/invitation_card_datail/invitation_card_detail.dart';
import 'package:wedding_management/services/card_service.dart';
import '../../../models/invitation_card.dart';
import 'package:wedding_management/size_config.dart';

class InvitationCardGrid extends StatefulWidget {
  const InvitationCardGrid({Key? key}) : super(key: key);

  @override
  State<InvitationCardGrid> createState() => _InvitationCardGridState();
}

class _InvitationCardGridState extends State<InvitationCardGrid> {
  final Stream<QuerySnapshot> _cardStream = InvitationCardService.getStreamOfCards();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _cardStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              InvitationCard invitationCard = InvitationCard.fromMap(document.data() as Map<String, dynamic>, document.id);
              return ShortImageCard(
                id: invitationCard.id!,
                title: invitationCard.title,
                coverImage: invitationCard.coverImage,
                rate: invitationCard.rate.toString(),
                onClicked: ()=>Navigator.of(context).pushNamed(InvitationCardDetail.routeName, arguments: invitationCard.id!),
              );
            }).toList());
      },
    );
  }
}
