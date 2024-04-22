import 'package:flutter_stok_takip/core/base/base_viewmodel.dart';
import 'package:flutter_stok_takip/core/models/sales/sales_model.dart';
import 'package:flutter_stok_takip/core/repositories/sales_repository.dart';
import 'package:flutter_stok_takip/locator.dart';

class SalesListViewModel extends BaseViewModel {
  final SalesRepository _salesRepository = locator.get<SalesRepository>();

  List<SalesModel> _sales = [];

  List<SalesModel> get sales => _sales;

  void getAllSales() {
    _salesRepository.getAll().then((value) {
      _sales = value;

      notifyListeners();
    });
  }
}
