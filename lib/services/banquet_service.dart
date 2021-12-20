import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_management/models/cart_item.dart';
import '../models/banquet.dart';


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
    print(response);
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
          price: double.parse(banquetData['price'])*double.parse(banquetData['invitations']),
          percentage: double.parse(banquetData['percentage']),
          image: banquetData['image'],
          data: banquetData,
          );
    }
  }

  static String checkPercentage(Map<String, dynamic> data) {
    int sum = 0;
    data.forEach((key, value) {
      if (value!=''){
        sum+=1;
      }
    });
    return sum==0 ? sum.toString() : (sum/data.length).toString();
  }

  static void setFormToLocalStorage(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String percentage = checkPercentage(data);
    data.putIfAbsent("percentage", () => percentage);
    prefs.setString('banquet_data', json.encode(data));
  }

  static Future<Map<String, dynamic>> getFormDataFromLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localData = prefs.getString('banquet_data');
    return  localData != null ?  json.decode(localData) as Map<String, dynamic> : {};
  }

}