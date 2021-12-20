import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_management/models/cart_item.dart';
import 'package:wedding_management/screens/cart/components/body.dart';

class OrderService {
  static Stream<QuerySnapshot> getStreamOfUserOrders(userId) {
    return FirebaseFirestore.instance
        .collection('orders')
        .doc(userId)
        .collection("user_orders")
        .snapshots();
  }

  static placeOrder(String userId, Map<String ,CartItem> products, Map<String, dynamic> banquetData, Map<String, dynamic> cardData) {
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

