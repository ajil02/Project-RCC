// cart.dart
import 'package:flutter/material.dart';

class CartItem {
  final String itemName;
  final double price;
  int quantity; // Add quantity property

  CartItem({
    required this.itemName,
    required this.price,
    this.quantity = 1, // Default quantity is 1
  });
}

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    // Check if the item is already in the cart
    int index =
        _items.indexWhere((element) => element.itemName == item.itemName);

    if (index != -1) {
      // If item is already in the cart, increment quantity
      _items[index].quantity += 1;
    } else {
      // If item is not in the cart, add it
      _items.add(item);
    }

    notifyListeners();
  }

  double get total {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void increaseQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
  }
}
