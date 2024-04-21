import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/ui/viewmodels/customer/customer_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/custom_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class BuildLastNameField extends StatelessWidget {
  const BuildLastNameField();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller:
          Provider.of<CustomerCreateViewModel>(context).form.fields['lastName'],
      label: "Soyisim",
      placeholder: "Doe",
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(3),
        FormBuilderValidators.maxLength(25),
      ]),
    );
  }
}
