import 'package:flutter_stok_takip/core/models/product/product_model.dart';

class BasketProductModel {
  final ProductModel product;
  int quantity;

  BasketProductModel({
    required this.product,
    required this.quantity,
  });
}
