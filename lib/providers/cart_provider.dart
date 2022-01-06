import 'package:flutter/foundation.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:wedding_management/services/card_service.dart';
import 'package:wedding_management/services/photographer_service.dart';
import 'package:wedding_management/services/rent_car_service.dart';
import 'package:wedding_management/services/utils.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartPackageItem> _packageItems = {};
  double avgPackage = 0;

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int itemQuantity(String productId, String color, String size){
    productId = changeId(productId, color, size);
    if (_items.containsKey(productId)) {
      return _items[productId]!.quantity;
    }
    return 0;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  String changeId(String productId, String color, String size){
    return '${productId}_${color}_$size';
  }
  void updateQuantity(String cartItemId, quantity){
    if (_items.containsKey(cartItemId)){
      _items.update(
        cartItemId,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: quantity,
          image: existingCartItem.image,
          color: existingCartItem.color,
          size: existingCartItem.size,
        ),
      );
    }
    notifyListeners();
  }

  void addItem(String productId, double price, String title, String image, String color, String size, int? quantity) {
    productId = changeId(productId, color, size);
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
            (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: quantity ?? existingCartItem.quantity + 1,
            image: existingCartItem.image,
            color: existingCartItem.color,
            size: existingCartItem.size,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
            () => CartItem(
            id: productId,
            title: title,
            price: price,
            quantity: quantity ?? 1,
            image: image,
                color: color,
              size: size,
        ),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(String productId, color, size) {
    productId = changeId(productId, color, size);
    if (!_items.containsKey(productId)) {
      return;
    }
    if(_items[productId]!.quantity==1) {
      _items.remove(productId);
    } else {
      _items.update(
        productId,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          image: existingCartItem.image,
          quantity: existingCartItem.quantity - 1,
          size: existingCartItem.size,
          color: existingCartItem.color,
        ),
      );
    }
    notifyListeners();

  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear(){
    _items={};
    notifyListeners();
  }

  Map<String, CartPackageItem> get packageItems {
    return {..._packageItems};
  }

  void addPackageCartItem(CartPackageItem item){
    if(_packageItems.containsKey(item.id)){
      _packageItems.update(item.id, (value) => item);
    } else{
      _packageItems.putIfAbsent(item.id, ()=>item);
    }
    notifyListeners();
  }

  void removePackageCartItem(String name, String dataName){
    _packageItems.remove(name);
    removeLocalData(dataName);
    notifyListeners();
  }

  Future<void> initPackageData() async{
    final banquet = await BanquetService.getCartItemFromLocalData();
    final invitationCard = await InvitationCardService.getCartItemFromLocalData();
    final photographer = await PhotographerService.getCartItemFromLocalData();
    final rentCar = await RentCarService.getCartItemFromLocalData();
    Map<String, CartPackageItem> packageItems = {};
    if(banquet != null){
      packageItems[banquet.id] = banquet;
    }
    if (invitationCard != null){
      packageItems[invitationCard.id] = invitationCard;
    }
    if (photographer != null){
      packageItems[photographer.id] = photographer;
    }
    if (rentCar != null){
      packageItems[rentCar.id] = rentCar;
    }
    _packageItems = packageItems;
    setAvgValue();
    notifyListeners();
  }

  Future<void> setBanquetDataFromDetail(
      {required String id,
        required String packageId,
        required String banquetName,
        required String packageName,
        required String image,
        required String price}) async {
    Map<String, dynamic> banquetData = await BanquetService.getFormDataFromLocalData();
    final data = {
      'banquetId': id,
      'packageId': packageId,
      'invitations': banquetData['invitations'] ?? '',
      'date': banquetData['date'] ?? '',
      'contactNo': banquetData['contactNo'] ?? '',
      'otherDetails': banquetData['otherDetails'] ?? '',
      'banquetName': banquetName,
      'packageName': packageName,
      'image': image,
      'price': price,
    };
    BanquetService.setFormToLocalStorage(data);
    addPackageCartItem(BanquetService.getCartItemFromData(data));
    setAvgValue();
  }

  Future<void> setInvitationCardDataFromDetail({required String id,required String cardTitle,required String image,required String price}) async {
    Map<String, dynamic> cardData = await InvitationCardService.getFormDataFromLocalData();
    final data = {
      'invitationCardId': id,
      'groomName': cardData['groomName'] ?? '',
      'brideName': cardData['brideName'] ?? '',
      'invitations': cardData['invitations'] ?? '',
      'contactNo': cardData['contactNo'] ?? '',
      'address': cardData['address'] ?? '',
      'email': cardData['email'] ?? '',
      'otherDetails': cardData['otherDetails'] ?? '',
      'cardTitle': cardTitle,
      'image': image,
      'price': price,
    };
    InvitationCardService.setFormToLocalStorage(data);
    addPackageCartItem(InvitationCardService.getCartItemFromData(data));
    setAvgValue();
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
    addPackageCartItem(PhotographerService.getCartItemFromData(data));
    setAvgValue();
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
    addPackageCartItem(RentCarService.getCartItemFromData(data));
    setAvgValue();
  }

  Map<String, double> getPercentage(){
    Map<String, double> percentageMap = {};
    _packageItems.forEach((key, value) => percentageMap[key]= value.percentage);
    return percentageMap;
  }

  void setAvgValue(){
    double sum = 0;
    _packageItems.forEach((key, value) => sum+=value.percentage);
    avgPackage = sum != 0? sum/_packageItems.length : 0;
  }

  bool isPackageValid(){
    return (avgPackage*100).toInt()==100;
  }
}