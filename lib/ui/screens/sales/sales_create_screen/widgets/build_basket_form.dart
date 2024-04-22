import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_create_screen/widgets/build_basket_list.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_create_screen/widgets/build_product_list.dart';
import 'package:flutter_stok_takip/ui/viewmodels/sales/sales_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/custom_page_sheet.dart';
import 'package:provider/provider.dart';

class BuildBasketForm extends StatelessWidget {
  const BuildBasketForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SalesCreateViewModel _viewModel =
        context.read<SalesCreateViewModel>();

    return Opacity(
      opacity: _viewModel.customerId == null ? 0.5 : 1,
      child: AbsorbPointer(
        absorbing: _viewModel.customerId == null,
        child: _buildFormHeader(_viewModel, context),
      ),
    );
  }

  Widget _buildFormHeader(
      SalesCreateViewModel viewModel, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text("Ürünler"),
      subtitle: Text("Düzenlemek için dokunun."),
      trailing: IconButton.outlined(
        onPressed: () {
          showPageSheet(
            page: BuildProductList(
              products: viewModel.products,
              onSubmit: (product, quantity) {
                viewModel.addBasket(product, quantity);
              },
            ),
            context: context,
          );
        },
        icon: Icon(Icons.add),
      ),
    );
  }
}
