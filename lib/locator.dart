import 'package:flutter_stok_takip/core/repositories/customer_repository.dart';
import 'package:flutter_stok_takip/core/repositories/product_repository.dart';
import 'package:flutter_stok_takip/core/repositories/sales_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(CustomerRepository());
  locator.registerSingleton(ProductRepository());
  locator.registerSingleton(SalesRepository());
}
