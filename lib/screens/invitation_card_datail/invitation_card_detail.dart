import 'package:flutter/material.dart';
import './components/body.dart';

class InvitationCardDetail extends StatelessWidget {
  static String routeName = '/invitation_card_detail';
  const InvitationCardDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String cardId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Body(invitationCardId: cardId,),
    );
  }
}
