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

  Future<void> setInvitationCardDataFromDetail({required String id,required String cardTitle,required String image,required String price}) async {
    Map<String, dynamic> cardData = await InvitationCardService.getFormDataFromLocalData();
    final data = {
      'invitationCardId': id,
      'groomName': cardData['groomName'] ?? '',
      'brideName': cardData['brideName'] ?? '',
      'invitations': cardData['invitations'] ?? '',
      'contactNo': cardData['contactNo'] ?? '',
      'address': cardData['address'] ?? '',
      'email': cardData['email'] ?? '',
      'otherDetails': cardData['otherDetails'] ?? '',
      'cardTitle': cardTitle,
      'image': image,
      'price': price,
    };
    InvitationCardService.setFormToLocalStorage(data);
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
