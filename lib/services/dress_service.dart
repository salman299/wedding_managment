import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dress.dart';


class DressService {

  static Stream<QuerySnapshot> getStreamOfBridalDresses() {
    return FirebaseFirestore.instance.collection('bridal_dresses').snapshots();
  }

  static Future<List<Dress>> getBridalDresses() async {
    final response = await FirebaseFirestore.instance.collection('bridal_dresses').get();
    return response.docs.map((e) => Dress.fromMap(e.data(), e.id)).toList();
  }

  static Future<Dress> getBridalDress(String id) async {
    final response = await FirebaseFirestore.instance.collection('bridal_dresses').doc(id).get();
    return Dress.fromMap(response.data()!, id);
  }

  static Stream<QuerySnapshot> getStreamOfGroomDresses() {
    return FirebaseFirestore.instance.collection('groom_dresses').snapshots();
  }

  static Future<List<Dress>> getGroomDresses() async {
    final response = await FirebaseFirestore.instance.collection('groom_dresses').get();
    return response.docs.map((e) => Dress.fromMap(e.data(), e.id)).toList();
  }

  static Future<Dress> getGroomDress(String id) async {
    final response = await FirebaseFirestore.instance.collection('groom_dresses').doc(id).get();
    return Dress.fromMap(response.data()!, id);
  }
  static void setFormToLocalStorage(Map<String, dynamic> data, bool isGroomDress) async {
    final String key= isGroomDress ? 'groom_dress_data' : 'bridal_dress_data';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(data));
  }

  static Future<Map<String, dynamic>> getFormDataFromLocalData(bool isGroomDress) async {
    final String key= isGroomDress ? 'groom_dress_data' : 'bridal_dress_data';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localData = prefs.getString(key);
    return localData != null ? json.decode(localData) as Map<String, dynamic>: {};
  }

}