import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_management/models/cart_item.dart';
import 'package:wedding_management/models/order_item.dart';

class OrderService {

  static Stream<QuerySnapshot> getStreamOfUserOrders(userId) {
    return FirebaseFirestore.instance
        .collection('orders')
        .doc(userId)
        .collection("user_orders")
        .snapshots();
  }

  static Future<List<OrderItem>> getUserOrders(userId) async {
    userId = 'ar3r0Ve5H3f7LpRgXLX9jqgmmZ72';
    final response = await FirebaseFirestore.instance.collection('orders').doc(userId).collection("user_orders").get();
    final List<OrderItem> orderItems= response.docs.map((orderData) {
      final products = (orderData.get('products') as List<dynamic>).map((e) => ProductOrderItem.fromMap(e)).toList();
      final Map<String, dynamic> banquetData = orderData.get('banquet');
      final banquet = banquetData.isEmpty ? null : BanquetOrderItem.fromMap(orderData.get('banquet'), 'banquet');
      final Map<String, dynamic> cardData = orderData.get('card');
      final card = cardData.isEmpty ? null : InvitationCardOrderItem.fromMap(orderData.get('card'), 'card');
      return OrderItem(products: products, banquet: banquet, invitationCard: card);
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
