import 'package:flutter_stok_takip/core/models/sales/sales_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SalesRepository {
  final String _boxName = 'salesbox';

  Future<Box<SalesModel>> get salesBox async => await Hive.openBox(_boxName);

  Future<void> add(SalesModel model) async {
    final box = await salesBox;

    return await box.put(model.id, model);
  }

  Future<List<SalesModel>> getAll() async {
    final box = await salesBox;

    return box.values.toList();
  }
}
