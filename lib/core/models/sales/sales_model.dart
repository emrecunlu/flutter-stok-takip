import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:flutter_stok_takip/core/models/product/product_basket_item.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'sales_model.g.dart';

@HiveType(typeId: 3)
class SalesModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final CustomerModel customer;

  @HiveField(2)
  final List<ProductBasketItem> products;

  @HiveField(3)
  final double totalPrice;

  @HiveField(4)
  final DateTime date;

  SalesModel({
    required this.id,
    required this.customer,
    required this.products,
    required this.totalPrice,
    required this.date,
  });

  factory SalesModel.create({
    required CustomerModel customer,
    required List<ProductBasketItem> products,
  }) {
    return SalesModel(
      id: Uuid().v4(),
      customer: customer,
      products: products,
      totalPrice: products
          .map((e) => e.product.price * e.quantity)
          .reduce((value, element) => value + element),
      date: DateTime.now(),
    );
  }
}
