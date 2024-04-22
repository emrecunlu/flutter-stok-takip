import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_view.dart';
import 'package:flutter_stok_takip/core/base/base_widget.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_create_screen/widgets/build_customer_dropdown.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_create_screen/widgets/build_basket_items.dart';
import 'package:flutter_stok_takip/ui/viewmodels/sales/sales_create_viewmodel.dart';

class SalesCreateScreen extends StatefulWidget {
  const SalesCreateScreen({super.key});

  @override
  State<SalesCreateScreen> createState() => _SalesCreateScreenState();
}

class _SalesCreateScreenState extends BaseWidget<SalesCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (model) {
        model.getAllCustomers();
        model.getAllProducts();
      },
      model: SalesCreateViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildCustomerDropdown(customers: model.customers),
                  verticalMargin(10),
                  _buildProductsForm(model),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductsForm(SalesCreateViewModel model) {
    return AbsorbPointer(
      absorbing: model.customer == null,
      child: Opacity(
        opacity: model.customer == null ? 0.5 : 1,
        child: BuildBasketItems(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Satış Ekle"),
    );
  }
}
