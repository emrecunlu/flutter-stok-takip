import 'package:flutter_stok_takip/core/base/base_viewmodel.dart';
import 'package:flutter_stok_takip/core/models/product/product_model.dart';
import 'package:flutter_stok_takip/core/repositories/product_repository.dart';
import 'package:flutter_stok_takip/locator.dart';

class ProductListViewModel extends BaseViewModel {
  final ProductRepository _productRepository = locator.get<ProductRepository>();
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  Future<void> getAllProducts() async {
    _productRepository.getAll().then((value) {
      _products = value;

      notifyListeners();
    });
  }
}
