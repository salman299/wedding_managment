import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_management/models/cart_item.dart';
import '../models/rent_car.dart';
import 'utils.dart';

class RentCarService {

  static Stream<QuerySnapshot> getStreamOfRentCars() {
    return FirebaseFirestore.instance.collection('cars').snapshots();
  }

  static Future<List<RentCar>> getRentCars() async {
    final response = await FirebaseFirestore.instance.collection('cars').get();
    return response.docs.map((e) => RentCar.fromMap(e.data(), e.id)).toList();
  }

  static Future<RentCar> getRentCar(String id) async {
    final response = await FirebaseFirestore.instance.collection('cars').doc(id).get();
    return RentCar.fromMap(response.data()!, id);
  }

  static Future<CartPackageItem?> getCartItemFromLocalData() async {
    final cardData = await getFormDataFromLocalData();
    if (cardData.isNotEmpty){
      return CartPackageItem(
        id: "car",
        title: cardData['title'],
        subtitle: '${cardData['date']} - ${cardData['days']} days',
        price: cardData['days'] != '' ? double.parse(cardData['price'])*double.parse(cardData['days']): null,
        percentage: double.parse(cardData['percentage']),
        image: cardData['image'],
        data: cardData,
      );
    }
  }
  static CartPackageItem getCartItemFromData(cardData){
    final percentage = checkPercentage(cardData);
    return CartPackageItem(
      id: "car",
      title: cardData['title'],
      subtitle: '${cardData['date']} - ${cardData['days']} days',
      price: cardData['days'] != '' ? double.parse(cardData['price'])*double.parse(cardData['days']): null,
      percentage: double.parse(percentage),
      image: cardData['image'],
      data: cardData,
    );
  }

  static void setFormToLocalStorage(Map<String, dynamic> data) async {
    setMapDataToLocalStorage('car_data', data);
  }

  static Future<Map<String, dynamic>> getFormDataFromLocalData() async {
    return await getMapDataFromLocalStorage('car_data');
  }
  static Future<void> deleteLocalData() async {
    await removeLocalData('car_data');
  }
}