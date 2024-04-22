import 'package:flutter_stok_takip/core/models/product/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product_basket_item.g.dart';

@HiveType(typeId: 4)
class ProductBasketItem {
  @HiveField(0)
  final ProductModel product;

  @HiveField(1)
  int quantity;

  ProductBasketItem({
    required this.product,
    required this.quantity,
  });
}
