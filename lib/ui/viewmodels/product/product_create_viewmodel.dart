import 'package:flutter_stok_takip/core/base/base_viewmodel.dart';
import 'package:flutter_stok_takip/core/models/product/product_model.dart';
import 'package:flutter_stok_takip/core/repositories/product_repository.dart';
import 'package:flutter_stok_takip/core/services/navigation_service.dart';
import 'package:flutter_stok_takip/locator.dart';
import 'package:flutter_stok_takip/ui/helpers/form_helper.dart';
import 'package:flutter_stok_takip/ui/helpers/toast_helper.dart';
import 'package:uuid/uuid.dart';

class ProductCreateViewModel extends BaseViewModel {
  final FormHelper _form = FormHelper({
    "title",
    "barcodeNumber",
    "price",
    "description",
    "stockQuantity",
  });
  final ProductRepository _productRepository = locator.get<ProductRepository>();

  FormHelper get form => _form;

  Future<void> submit() async {
    if (_form.formKey.currentState!.validate()) {
      var json = form.toJson();
      final uuid = Uuid();

      json['id'] = uuid.v4();
      json['description'] =
          json['description'].length > 0 ? json['description'] : null;
      json['price'] = double.parse(json['price']);
      json['stockQuantity'] = int.parse(json['stockQuantity']);

      await _productRepository.add(ProductModel.fromJson(json));

      ToastHelper.success("Ürün eklendi");
      NavigationService.goBack();
    }
  }
}
