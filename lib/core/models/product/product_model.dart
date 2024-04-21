import 'package:hive_flutter/hive_flutter.dart';

part 'product_model.g.dart';

@HiveType(typeId: 2)
class ProductModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String barcodeNumber;

  @HiveField(3)
  int stockQuantity;

  @HiveField(4)
  double price;

  @HiveField(5)
  String? description;

  ProductModel({
    required this.id,
    required this.title,
    required this.barcodeNumber,
    required this.stockQuantity,
    required this.price,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      barcodeNumber: json['barcodeNumber'],
      stockQuantity: json['stockQuantity'],
      price: json['price'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'barcodeNumber': barcodeNumber,
      'stockQuantity': stockQuantity,
      'price': price,
      'description': description
    };
  }
}
