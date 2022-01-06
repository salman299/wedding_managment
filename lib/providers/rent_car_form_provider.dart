import 'package:flutter/cupertino.dart';
import 'package:wedding_management/models/rent_car.dart';
import 'package:wedding_management/services/rent_car_service.dart';

class RentCarFormProvider with ChangeNotifier {
  String rentCarId = '';
  List<RentCar> rentCars = [];

  void setRentCarId(id) {
    rentCarId = id;
    notifyListeners();
  }

  Future<void> setRentCarDataFromDetail({required String id, required String title, required String image, required String price}) async {
    final rentCarData = await RentCarService.getFormDataFromLocalData();
    final data = {
      'rentCarId': id,
      'days': rentCarData['days'] ?? '',
      'date': rentCarData['date'] ?? '',
      'address': rentCarData['address'] ?? '',
      'city': rentCarData['city'] ?? '',
      'contactNo': rentCarData['contactNo'] ?? '',
      'otherDetails': rentCarData['otherDetails'] ?? '',
      'title': title,
      'image': image,
      'price': price,
    };
    RentCarService.setFormToLocalStorage(data);
  }

  Future<List<RentCar>> getRentCars() async{
    if(rentCars.isEmpty){
      final data = await RentCarService.getRentCars();
      rentCars = data;
      notifyListeners();
    }
    return rentCars;
  }


}
