import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/ui/viewmodels/product/product_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/custom_text_field.dart';
import 'package:provider/provider.dart';

class BuildDescriptionField extends StatelessWidget {
  const BuildDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: "Açıklama",
      placeholder: "Ürün Açıklama",
      textInputType: TextInputType.multiline,
      controller:
          context.read<ProductCreateViewModel>().form.fields['description'],
    );
  }
}
