import 'dart:convert';

import 'package:shamo_frontend_rizky/models/product_model.dart';

class CartModel {
  late int id;
  late ProductModel product;
  late int quantity;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  CartModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductModel.fromJson(json['product']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'product': product.tojson(),
      'quantity': quantity,
    };
  }

  // todo : menghitung harga * quantity
  double getTotalPrice() {
    return product.price * quantity;
  }
}
