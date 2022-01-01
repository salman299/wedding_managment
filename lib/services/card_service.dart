import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_management/models/cart_item.dart';
import '../models/invitation_card.dart';
import 'utils.dart';

class InvitationCardService {

  static Stream<QuerySnapshot> getStreamOfCards() {
    return FirebaseFirestore.instance.collection('cards').snapshots();
  }

  static Future<List<InvitationCard>> getCards() async {
    final response = await FirebaseFirestore.instance.collection('cards').get();
    return response.docs.map((e) => InvitationCard.fromMap(e.data(), e.id)).toList();
  }

  static Future<InvitationCard> getCard(String id) async {
    final response = await FirebaseFirestore.instance.collection('cards').doc(id).get();
    return InvitationCard.fromMap(response.data()!, id);
  }

  static Future<CartPackageItem?> getCartItemFromLocalData() async {
    final cardData = await getFormDataFromLocalData();
    if (cardData.isNotEmpty){
      return CartPackageItem(
        id: "invitation_card",
        title: cardData['cardTitle'],
        subtitle: '',
        price: double.parse(cardData['price'])*double.parse(cardData['invitations']),
        percentage: double.parse(cardData['percentage']),
        image: cardData['image'],
        data: cardData,
      );
    }
  }

  static void setFormToLocalStorage(Map<String, dynamic> data) async {
    setMapDataToLocalStorage('invitation_card_data', data);
  }

  static Future<Map<String, dynamic>> getFormDataFromLocalData() async {
    return await getMapDataFromLocalStorage('invitation_card_data');
  }

}