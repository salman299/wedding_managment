import 'package:flutter/cupertino.dart';
import 'package:wedding_management/models/invitation_card.dart';
import 'package:wedding_management/models/photographer.dart';
import 'package:wedding_management/services/card_service.dart';
import 'package:wedding_management/services/photographer_service.dart';

class PhotographerFormProvider with ChangeNotifier {
  String photographerId = '';
  List<Photographer> photographers = [];

  void setPhotographerId(id) {
    photographerId = id;
    notifyListeners();
  }

  Future<List<Photographer>> getPhotographers() async{
    if(photographers.isEmpty){
      final data = await PhotographerService.getPhotographers();
      photographers = data;
      notifyListeners();
    }
    return photographers;
  }

}
