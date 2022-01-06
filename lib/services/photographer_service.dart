import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_management/models/cart_item.dart';
import '../models/photographer.dart';
import 'utils.dart';

class PhotographerService {

  static Stream<QuerySnapshot> getStreamOfPhotographers() {
    return FirebaseFirestore.instance.collection('photographers').snapshots();
  }

  static Future<List<Photographer>> getPhotographers() async {
    final response = await FirebaseFirestore.instance.collection('photographers').get();
    return response.docs.map((e) => Photographer.fromMap(e.data(), e.id)).toList();
  }

  static Future<Photographer> getPhotographer(String id) async {
    final response = await FirebaseFirestore.instance.collection('photographers').doc(id).get();
    return Photographer.fromMap(response.data()!, id);
  }

  static Future<CartPackageItem?> getCartItemFromLocalData() async {
    final cardData = await getFormDataFromLocalData();
    if (cardData.isNotEmpty){
      return CartPackageItem(
        id: "photographer",
        title: cardData['title'],
        subtitle: '',
        price: cardData['hours'] != '' ? double.parse(cardData['price'])*double.parse(cardData['hours'])*double.parse(cardData['noOfPhotographers']) : null,
        percentage: double.parse(cardData['percentage']),
        image: cardData['image'],
        data: cardData,
      );
    }
  }

  static void setFormToLocalStorage(Map<String, dynamic> data) async {
    setMapDataToLocalStorage('photographer_data', data);
  }

  static Future<Map<String, dynamic>> getFormDataFromLocalData() async {
    return await getMapDataFromLocalStorage('photographer_data');
  }
  static Future<void> deleteLocalData() async {
    await removeLocalData('photographer_data');
  }
}