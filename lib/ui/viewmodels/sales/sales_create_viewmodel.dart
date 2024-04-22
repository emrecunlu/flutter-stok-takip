import 'package:flutter_stok_takip/core/base/base_viewmodel.dart';
import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:flutter_stok_takip/core/models/product/product_basket_item.dart';
import 'package:flutter_stok_takip/core/models/product/product_model.dart';
import 'package:flutter_stok_takip/core/models/sales/sales_model.dart';
import 'package:flutter_stok_takip/core/repositories/customer_repository.dart';
import 'package:flutter_stok_takip/core/repositories/product_repository.dart';
import 'package:flutter_stok_takip/core/repositories/sales_repository.dart';
import 'package:flutter_stok_takip/core/services/navigation_service.dart';
import 'package:flutter_stok_takip/locator.dart';
import 'package:flutter_stok_takip/ui/helpers/toast_helper.dart';

class SalesCreateViewModel extends BaseViewModel {
  final CustomerRepository _customerRepository =
      locator.get<CustomerRepository>();
  final ProductRepository _productRepository = locator.get<ProductRepository>();
  final SalesRepository _salesRepository = locator.get<SalesRepository>();

  CustomerModel? _customer;
  List<CustomerModel> _customers = [];
  List<ProductModel> _products = [];
  List<ProductBasketItem> _basketItems = [];

  List<CustomerModel> get customers => _customers;
  List<ProductModel> get products => _products;
  CustomerModel? get customerId => _customer;
  List<ProductBasketItem> get basketItems => _basketItems;

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
    _basketItems = [];

    notifyListeners();
  }

  void removeBasketItem(int index) {
    _basketItems.removeAt(index);

    notifyListeners();
  }

  Future<void> addBasket(ProductModel product, int quantity) async {
    _basketItems.add(ProductBasketItem(product: product, quantity: quantity));

    NavigationService.goBack();

    notifyListeners();
  }

  Future<void> submit() async {
    if (_customer != null) {
      await _salesRepository
          .add(SalesModel.create(customer: _customer!, products: _basketItems));

      _basketItems.forEach((basketItem) async {
        basketItem.product.stockQuantity -= basketItem.quantity;

        await _productRepository.update(basketItem.product.id,
            ProductModel.fromJson(basketItem.product.toJson()));
      });

      ToastHelper.success("Satış Başarılı");

      _customer = null;
      _basketItems = [];

      notifyListeners();
    }
  }
}
