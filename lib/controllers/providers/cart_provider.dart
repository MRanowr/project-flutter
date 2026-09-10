import 'package:flutter/material.dart';
import '../../models/cart_item.dart';
import '../../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // إجمالي عدد العناصر في السلة
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  // حساب المبلغ الإجمالي
  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  // إضافة منتج للسلة
  void addItem(Product product) {
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  // تقليل الكمية أو حذف العنصر إذا وصلت الكمية لـ 0
  void removeSingleItem(String productId) {
    int index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  // حذف العنصر بالكامل من السلة
  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  // تفريغ السلة تماماً
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}