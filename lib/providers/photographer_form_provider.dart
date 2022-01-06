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

  Future<void> setPhotographerDataFromDetail(
      {required String id,
      required String title,
      required String image,
      required String price}) async {
    final photographerData =
        await PhotographerService.getFormDataFromLocalData();
    final data = {
      'photographerId': id,
      'noOfPhotographers': photographerData['noOfPhotographers'] ?? '',
      'hours': photographerData['hours'] ?? '',
      'contactNo': photographerData['contactNo'] ?? '',
      'otherDetails': photographerData['otherDetails'] ?? '',
      'title': title,
      'image': image,
      'price': price,
    };
    PhotographerService.setFormToLocalStorage(data);
  }

  Future<List<Photographer>> getPhotographers() async {
    if (photographers.isEmpty) {
      final data = await PhotographerService.getPhotographers();
      photographers = data;
      notifyListeners();
    }
    return photographers;
  }
}
