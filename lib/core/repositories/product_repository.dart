import 'package:flutter_stok_takip/core/models/product/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductRepository {
  final String _boxName = 'productBox';

  Future<Box<ProductModel>> get productBox async =>
      await Hive.openBox(_boxName);

  Future<void> add(ProductModel model) async {
    final _box = await productBox;

    return await _box.put(model.id, model);
  }

  Future<List<ProductModel>> getAll() async {
    final _box = await productBox;

    return _box.values.toList();
  }

  Future<void> update(String id, ProductModel model) async {
    final _box = await productBox;

    if (_box.get(id) != null) {
      return await _box.put(id, model);
    }
  }

  Future<void> delete(String id) async {
    final _box = await productBox;

    if (_box.get(id) != null) {
      return await _box.delete(id);
    }
  }
}
