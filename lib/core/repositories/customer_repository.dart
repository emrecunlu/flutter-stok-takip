import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomerRepository {
  final String _boxName = 'customerBox';

  Future<Box<CustomerModel>> get customerBox async =>
      await Hive.openBox(_boxName);

  Future<List<CustomerModel>> getAll() async {
    final _box = await customerBox;

    return _box.values.toList();
  }

  Future<void> add(CustomerModel model) async {
    final _box = await customerBox;

    return await _box.put(model.id, model);
  }

  Future<void> update(CustomerModel model) async {
    final _box = await customerBox;

    if (_box.get(model.id) != null) {
      return await _box.put(model.id, model);
    }
  }

  Future<void> delete(String id) async {
    final _box = await customerBox;

    if (_box.get(id) != null) {
      return await _box.delete(id);
    }
  }
}
