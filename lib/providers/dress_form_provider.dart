import 'package:flutter/cupertino.dart';
import 'package:wedding_management/models/dress.dart';
import 'package:wedding_management/services/dress_service.dart';

class DressFormProvider with ChangeNotifier {
  String groomDressId = '';
  String bridalDressId = '';
  List<Dress> bridalDresses = [];
  List<Dress> groomDresses = [];

  void setBridalDressId(id) {
    bridalDressId = id;
    notifyListeners();
  }

  Future<List<Dress>> gerBridalDresses() async{
    if(bridalDresses.isEmpty){
      final data = await DressService.getBridalDresses();
      bridalDresses = data;
      notifyListeners();
    }
    return bridalDresses;
  }

  void setGroomDressId(id) {
    groomDressId = id;
    notifyListeners();
  }

  Future<List<Dress>> gerGroomDresses() async{
    if(groomDressId.isEmpty){
      final data = await DressService.getGroomDresses();
      groomDresses = data;
      notifyListeners();
    }
    return groomDresses;
  }

}
