import 'package:flutter_stok_takip/core/repositories/customer_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(CustomerRepository());
}
