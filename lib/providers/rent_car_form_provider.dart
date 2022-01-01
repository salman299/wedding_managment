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

  Future<List<RentCar>> getRentCars() async{
    if(rentCars.isEmpty){
      final data = await RentCarService.getRentCars();
      rentCars = data;
      notifyListeners();
    }
    return rentCars;
  }

}
