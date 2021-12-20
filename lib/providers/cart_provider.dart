import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

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

  void removeItem(String productId, color, size) {
    _items.remove(changeId(productId, color, size));
    notifyListeners();
  }

  void clear(){
    _items={};
    notifyListeners();
  }
}