import 'package:flutter/cupertino.dart';
import 'package:wedding_management/models/invitation_card.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:wedding_management/services/card_service.dart';

class InvitationCardFormProvider with ChangeNotifier {
  String invitationCardId = '';
  List<InvitationCard> invitationCards = [];

  void setInvitationCardId(id) {
    invitationCardId = id;
    notifyListeners();
  }


  Future<List<InvitationCard>> getInvitationCards() async{
    if(invitationCards.isEmpty){
      final data = await InvitationCardService.getCards();
      invitationCards = data;
      notifyListeners();
    }
    return invitationCards;
  }

}
