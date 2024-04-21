import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/ui/viewmodels/customer/customer_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/custom_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class BuildTcNumberField extends StatelessWidget {
  const BuildTcNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller:
          Provider.of<CustomerCreateViewModel>(context).form.fields['tcNumber'],
      label: "TC Numarası",
      placeholder: "11111111111",
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.equalLength(11),
        FormBuilderValidators.numeric(),
      ]),
    );
  }
}
