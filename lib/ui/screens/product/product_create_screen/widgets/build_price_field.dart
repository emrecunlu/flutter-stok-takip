import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/ui/viewmodels/product/product_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/custom_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class BuildPriceField extends StatelessWidget {
  const BuildPriceField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: "Satış Fiyat",
      placeholder: "19.99",
      textInputType: TextInputType.numberWithOptions(
        decimal: true,
      ),
      controller: context.read<ProductCreateViewModel>().form.fields['price'],
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
  }
}
