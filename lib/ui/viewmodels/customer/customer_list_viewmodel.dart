import 'package:flutter_stok_takip/core/base/base_viewmodel.dart';
import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:flutter_stok_takip/core/repositories/customer_repository.dart';
import 'package:flutter_stok_takip/locator.dart';

class CustomerListViewModel extends BaseViewModel {
  final CustomerRepository _customerRepository =
      locator.get<CustomerRepository>();
  List<CustomerModel> _customers = [];

  List<CustomerModel> get customers => _customers;

  Future<void> getAllCustomers() async {
    _customerRepository.getAll().then((values) {
      _customers = values;

      notifyListeners();
    });
  }

  Future<void> deleteCustomer(String id) async {
    await _customerRepository.delete(id);

    getAllCustomers();
  }
}
