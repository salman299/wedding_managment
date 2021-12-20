import 'package:flutter/material.dart';
import 'package:wedding_management/components/app_bar.dart';
import './components/body.dart';
class InvitationCardForm extends StatelessWidget {
  static String routeName = "/invitation_card_form";
  const InvitationCardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: " Invitation Card",),
      body: Body(),
    );
  }
}

