import 'package:flutter/cupertino.dart';
import 'package:wedding_management/models/banquet.dart';
import 'package:wedding_management/services/banquet_service.dart';

class BanquetFormProvider with ChangeNotifier {
  String banquetId = '';
  String banquetPackageId = '';
  List<Banquet> banquets = [];

  void setBanquetId(id) {
    banquetPackageId = '';
    banquetId = id;
    notifyListeners();
  }

  void setBanquetPackageId(id) {
    banquetPackageId = id;
    notifyListeners();
  }

  void setBanquetData(id, packageId) {
    banquetId = id;
    banquetPackageId = packageId;
    notifyListeners();
  }

  Future<List<Banquet>> getBanquets() async {
    if (banquets.isEmpty) {
      final data = await BanquetService.getBanquets();
      banquets = data;
      notifyListeners();
    }
    return banquets;
  }

  Future<List<BanquetPackage>> getBanquetPackages(id) async {
    final index = banquets.indexWhere((element) => element.id == id);
    if (banquets[index].banquetPackages.isEmpty) {
      final data = await BanquetService.getBanquetPackages(id);
      banquets[index].banquetPackages = data;
      notifyListeners();
    }
    return banquets[index].banquetPackages;
  }

  Future<Map<String, dynamic>> getFormDataFromLocalData() async {
    return BanquetService.getFormDataFromLocalData();
  }
}
