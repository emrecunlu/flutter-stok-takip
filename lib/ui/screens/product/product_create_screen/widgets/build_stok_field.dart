import 'package:flutter/widgets.dart';
import 'package:flutter_stok_takip/ui/viewmodels/product/product_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/custom_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class BuildStockField extends StatelessWidget {
  const BuildStockField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: "Stok Sayısı",
      placeholder: "100",
      textInputType: TextInputType.number,
      controller:
          context.read<ProductCreateViewModel>().form.fields['stockQuantity'],
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
  }
}
