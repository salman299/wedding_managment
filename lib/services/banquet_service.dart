import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_management/models/cart_item.dart';
import '../models/banquet.dart';
import 'utils.dart';

class BanquetService {
  static Stream<QuerySnapshot> getStreamOfBanquets() {
      return FirebaseFirestore.instance.collection('banquets').snapshots();
  }

  static Future<Banquet?> getBanquet(String id) async {
    try{
      final response = await FirebaseFirestore.instance.collection('banquets').doc(id).get();
      return Banquet.fromMap(response.data()!, id);
    } catch (error){
      rethrow;
    }
  }

  static Stream<QuerySnapshot> getStreamOfBanquetServices(String id){
    return FirebaseFirestore.instance.collection('banquets').doc(id).collection('packages').snapshots();
  }

  static Future<List<Banquet>> getBanquets() async {
    final response = await FirebaseFirestore.instance.collection('banquets').get();
    return response.docs.map((e) => Banquet.fromMap(e.data(), e.id)).toList();
  }

  static Future<List<BanquetPackage>> getBanquetPackages(String id) async {
    final response = await FirebaseFirestore.instance.collection('banquets').doc(id).collection('packages').get();
    return response.docs.map((e) => BanquetPackage.fromMap(e.data(), e.id)).toList();
  }

  static Future<CartPackageItem?> getCartItemFromLocalData() async {
    final banquetData = await getFormDataFromLocalData();
    if (banquetData.isNotEmpty){
      return CartPackageItem(
          id: "banquet",
          title: banquetData['banquetName'],
          subtitle: banquetData['packageName'],
          price: banquetData['invitations'] != '' ? double.parse(banquetData['price'])*double.parse(banquetData['invitations']): null,
          percentage: double.parse(banquetData['percentage']),
          image: banquetData['image'],
          data: banquetData,
          );
    }
  }
  static CartPackageItem getCartItemFromData(banquetData){
    final percentage = checkPercentage(banquetData);
      return CartPackageItem(
        id: "banquet",
        title: banquetData['banquetName'],
        subtitle: banquetData['packageName'],
        price: banquetData['invitations'] != '' ? double.parse(banquetData['price'])*double.parse(banquetData['invitations']): null,
        percentage: double.parse(percentage),
        image: banquetData['image'],
        data: banquetData,
      );
  }

  static void setFormToLocalStorage(Map<String, dynamic> data) async {
    setMapDataToLocalStorage('banquet_data', data);
  }

  static Future<Map<String, dynamic>> getFormDataFromLocalData() async {
    return await getMapDataFromLocalStorage('banquet_data');
  }

  static Future<void> deleteLocalData() async {
    await removeLocalData('banquet_data');
  }
}