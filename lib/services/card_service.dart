import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/invitation_card.dart';


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

  static void setFormToLocalStorage(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('invitation_card_data', json.encode(data));
  }

  static Future<Map<String, dynamic>> getFormDataFromLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localData = prefs.getString('invitation_card_data');
    return localData != null ? json.decode(localData) as Map<String, dynamic>: {};
  }

}