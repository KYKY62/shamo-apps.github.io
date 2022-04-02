import 'package:flutter/material.dart';
import 'package:shamo_frontend_rizky/models/cart_model.dart';
import 'package:shamo_frontend_rizky/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[index].quantity++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int totalitem = 0;
    for (var item in _carts) {
      totalitem += item.quantity;
    }
    return totalitem;
  }

  totalPrice() {
    double pricetotal = 0;
    for (var item in _carts) {
      pricetotal += (item.quantity * item.product.price);
    }
    return pricetotal;
  }
}
