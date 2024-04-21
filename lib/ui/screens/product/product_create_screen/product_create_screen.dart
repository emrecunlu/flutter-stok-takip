import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_view.dart';
import 'package:flutter_stok_takip/core/base/base_widget.dart';
import 'package:flutter_stok_takip/ui/screens/product/product_create_screen/widgets/build_barcode_field.dart';
import 'package:flutter_stok_takip/ui/screens/product/product_create_screen/widgets/build_description_field.dart';
import 'package:flutter_stok_takip/ui/screens/product/product_create_screen/widgets/build_price_field.dart';
import 'package:flutter_stok_takip/ui/screens/product/product_create_screen/widgets/build_stok_field.dart';
import 'package:flutter_stok_takip/ui/screens/product/product_create_screen/widgets/build_title_field.dart';
import 'package:flutter_stok_takip/ui/viewmodels/product/product_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/build_submit_button.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends BaseWidget<ProductCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: ProductCreateViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SingleChildScrollView(
            child: Form(
              key: model.form.formKey,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    BuildTitleField(),
                    verticalMargin(16),
                    BuildBarcodeField(),
                    verticalMargin(16),
                    BuildStockField(),
                    verticalMargin(16),
                    BuildPriceField(),
                    verticalMargin(16),
                    BuildDescriptionField(),
                    verticalMargin(24),
                    BuildSubmitButon(onPressed: () {
                      model.submit();
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Ürün Ekle"),
    );
  }
}
