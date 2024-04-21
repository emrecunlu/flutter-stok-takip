import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/ui/viewmodels/customer/customer_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/custom_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class BuildAddressField extends StatelessWidget {
  const BuildAddressField();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller:
          Provider.of<CustomerCreateViewModel>(context).form.fields['address'],
      label: "Adres",
      textInputType: TextInputType.multiline,
      placeholder: "Yazıbaşı Mahallesi, 5063 Sokak, No:1",
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.maxLength(255),
      ]),
    );
  }
}
