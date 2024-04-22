import 'package:flutter_stok_takip/core/base/base_viewmodel.dart';
import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:flutter_stok_takip/core/models/product/product_model.dart';
import 'package:flutter_stok_takip/core/repositories/customer_repository.dart';
import 'package:flutter_stok_takip/core/repositories/product_repository.dart';
import 'package:flutter_stok_takip/core/services/navigation_service.dart';
import 'package:flutter_stok_takip/locator.dart';

class SalesCreateViewModel extends BaseViewModel {
  final CustomerRepository _customerRepository =
      locator.get<CustomerRepository>();
  final ProductRepository _productRepository = locator.get<ProductRepository>();

  CustomerModel? _customer;
  List<CustomerModel> _customers = [];
  List<ProductModel> _products = [];

  List<CustomerModel> get customers => _customers;
  List<ProductModel> get products => _products;
  CustomerModel? get customer => _customer;

  Future<void> getAllCustomers() async {
    _customerRepository.getAll().then((value) {
      _customers = value;

      notifyListeners();
    });
  }

  Future<void> getAllProducts() async {
    _productRepository.getAll().then((value) {
      _products = value;

      notifyListeners();
    });
  }

  void setSelectedCustomer(CustomerModel? value) {
    _customer = value;

    notifyListeners();
  }
}
