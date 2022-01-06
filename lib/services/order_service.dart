import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_management/models/cart_item.dart';
import 'package:wedding_management/models/order_item.dart';
import 'package:wedding_management/services/photographer_service.dart';

class OrderService {

  static Stream<QuerySnapshot> getStreamOfUserOrders(userId) {
    return FirebaseFirestore.instance
        .collection('orders')
        .doc(userId)
        .collection("user_orders")
        .snapshots();
  }

  static Future<List<OrderItem>> getUserOrders(userId) async {
    print("MAMAMd");
    print(userId);
    final response = await FirebaseFirestore.instance.collection('orders').doc(userId).collection("user_orders").get();
    final List<OrderItem> orderItems= response.docs.map((orderData) {
      final products = (orderData.get('products') as List<dynamic>).map((e) => ProductOrderItem.fromMap(e)).toList();
      print(products);
      final Map<String, dynamic> banquetData = orderData.get('banquet');
      print(banquetData);
      final banquet = banquetData.isEmpty ? null : BanquetOrderItem.fromMap(banquetData, 'banquet');
      print("asdasdasd");
      final Map<String, dynamic> cardData = orderData.get('card');
      final card = cardData.isEmpty ? null : InvitationCardOrderItem.fromMap(cardData, 'card');
      final Map<String, dynamic> photographerData = orderData.get('photographer');
      final photographer = photographerData.isEmpty ? null : PhotographerOrderItem.fromMap(photographerData, 'photographerData');
      final Map<String, dynamic> rentCarData = orderData.get('rentCar');
      final rentCar = rentCarData.isEmpty ? null : RentCarOrderItem.fromMap(rentCarData, 'rentCar');
      final date = orderData.get('date');
      return OrderItem(products: products, banquet: banquet, invitationCard: card, photographer: photographer, rentCar: rentCar, date: date);
    }).toList();

    return orderItems;
  }

  static placeOrder(String userId, Map<String ,CartItem> products, Map<dynamic, dynamic> banquetData, Map<dynamic, dynamic> cardData, Map<dynamic,dynamic> photographerData,Map<dynamic,dynamic> carData) {
    FirebaseFirestore.instance
        .collection('orders')
        .doc(userId)
        .collection("user_orders")
        .add({
      "banquet": {
        ...banquetData,
      },
      "card" : {
        ...cardData,
      },
      "photographer": {
        ...photographerData,
      },
      "rentCar" : {
        ...carData,
      },
      "date" : DateTime.now().toString(),
      "products": products.values
          .map((item) => {
                "id": item.id,
                "title": item.title,
                "price": item.price,
                "quantity": item.quantity,
              })
          .toList(),
    });
  }
}
