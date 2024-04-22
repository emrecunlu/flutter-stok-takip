import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_view.dart';
import 'package:flutter_stok_takip/ui/screens/customer/customer_list_screen/widgets/build_customer.dart';
import 'package:flutter_stok_takip/ui/viewmodels/customer/customer_list_viewmodel.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (model) {
        model.getAllCustomers();
      },
      model: CustomerListViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: model.customers.length > 0
              ? _buildListView(model)
              : _buildEmptyCustomers(),
        );
      },
    );
  }

  Center _buildEmptyCustomers() {
    return Center(
      child: Text("Müşteri Kaydı Bulunamadı"),
    );
  }

  ListView _buildListView(CustomerListViewModel model) {
    return ListView.builder(
      itemCount: model.customers.length,
      itemBuilder: (context, index) {
        return BuildCustomer(customer: model.customers[index]);
      },
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: Text("Müşteriler"),
      );
}
