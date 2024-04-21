import 'package:flutter_stok_takip/core/base/base_viewmodel.dart';
import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:flutter_stok_takip/core/repositories/customer_repository.dart';
import 'package:flutter_stok_takip/core/services/navigation_service.dart';
import 'package:flutter_stok_takip/locator.dart';
import 'package:flutter_stok_takip/ui/helpers/form_helper.dart';
import 'package:flutter_stok_takip/ui/helpers/toast_helper.dart';
import 'package:uuid/uuid.dart';

class CustomerCreateViewModel extends BaseViewModel {
  final FormHelper _form = FormHelper(
    {"firstName", "lastName", "tcNumber", "address"},
  );
  final CustomerRepository _customerRepository =
      locator.get<CustomerRepository>();

  FormHelper get form => _form;

  void fillForm(CustomerModel toUpdate) {
    final json = toUpdate.toJson();

    _form.fields.forEach((key, value) {
      value.text = json[key] == null ? '' : json[key];
    });
  }

  Future<void> submit(CustomerModel? toUpdate) async {
    if (_form.formKey.currentState!.validate()) {
      var json = _form.toJson();
      final uuid = Uuid();

      if (toUpdate == null) {
        json['id'] = uuid.v4();

        await _customerRepository.add(CustomerModel.fromJson(json));
        await ToastHelper.success("Müşteri eklendi");

        NavigationService.goBack();
      } else {
        json['id'] = toUpdate.id;
        await _customerRepository.update(CustomerModel.fromJson(json));

        NavigationService.goBack();
      }
    }
  }
}
