import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/ui/helpers/toast_helper.dart';
import 'package:flutter_stok_takip/ui/viewmodels/product/product_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/custom_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class BuildBarcodeField extends StatelessWidget {
  const BuildBarcodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextField(
            label: "Barkod Numarası",
            placeholder: "A11111111",
            controller: context
                .read<ProductCreateViewModel>()
                .form
                .fields['barcodeNumber'],
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
        ),
        SizedBox(width: 6),
        IconButton.outlined(
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            ToastHelper.success("Barcode Scanner");
          },
        )
      ],
    );
  }
}
