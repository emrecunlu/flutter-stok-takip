import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_view.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_list_screen/widgets/build_sale.dart';
import 'package:flutter_stok_takip/ui/viewmodels/sales/sales_list_viewmodel.dart';

class SalesListScreen extends StatelessWidget {
  const SalesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (model) {
        model.getAllSales();
      },
      model: SalesListViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildSalesList(model),
        );
      },
    );
  }

  ListView _buildSalesList(SalesListViewModel model) {
    return ListView.builder(
      itemCount: model.sales.length,
      itemBuilder: (context, index) {
        final sales = model.sales[index];

        return BuildSale(
          sales: sales,
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Satışlar"),
    );
  }
}
