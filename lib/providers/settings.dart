import 'package:flutter/cupertino.dart';
import 'package:wedding_management/models/invitation_card.dart';
import 'package:wedding_management/services/card_service.dart';


class AppSettings with ChangeNotifier {
  int pageIndex = 0;

  void setPageIndex(index){
    pageIndex= index;
    notifyListeners();
  }

}
