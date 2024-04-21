import 'package:flutter/material.dart';
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

  void fillForm(ProductModel model) {
    final json = model.toJson();

    debugPrint(model.toJson().toString());

    _form.fields.forEach((key, value) {
      value.text = json[key] != null ? json[key].toString() : "";
    });
  }

  Future<void> submit(ProductModel? toUpdate) async {
    if (_form.formKey.currentState!.validate()) {
      var json = form.toJson();
      final uuid = Uuid();

      json['description'] =
          json['description'].length > 0 ? json['description'] : null;
      json['price'] = double.parse(json['price']);
      json['stockQuantity'] = int.parse(json['stockQuantity']);

      if (toUpdate == null) {
        json['id'] = uuid.v4();
        await _productRepository.add(ProductModel.fromJson(json));

        ToastHelper.success("Ürün eklendi");
        NavigationService.goBack();
      } else {
        json['id'] = toUpdate.id;

        await _productRepository.update(
            toUpdate.id, ProductModel.fromJson(json));
        NavigationService.goBack();
      }
    }
  }
}
