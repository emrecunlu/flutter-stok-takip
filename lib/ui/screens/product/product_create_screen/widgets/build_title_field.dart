import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/ui/viewmodels/product/product_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/custom_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class BuildTitleField extends StatelessWidget {
  const BuildTitleField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: "Ürün Adı",
      placeholder: "Deneme Ürün",
      controller: context.read<ProductCreateViewModel>().form.fields['title'],
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
  }
}
