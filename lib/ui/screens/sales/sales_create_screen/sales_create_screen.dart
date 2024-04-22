import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_view.dart';
import 'package:flutter_stok_takip/core/base/base_widget.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_create_screen/widgets/build_basket_form.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_create_screen/widgets/build_basket_list.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_create_screen/widgets/build_customer_dropdown.dart';
import 'package:flutter_stok_takip/ui/viewmodels/sales/sales_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/build_submit_button.dart';

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
          body: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BuildCustomerDropdown(),
                verticalMargin(10),
                BuildBasketForm(),
                BuildBasketList(),
                _buildSubmitButton(model)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubmitButton(SalesCreateViewModel viewModel) {
    return Visibility(
      visible: viewModel.basketItems.length > 0,
      child: BuildSubmitButon(onPressed: () {
        viewModel.submit();
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Satış Ekle"),
    );
  }
}
