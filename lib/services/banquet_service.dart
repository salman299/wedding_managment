import 'package:cloud_firestore/cloud_firestore.dart';
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
}