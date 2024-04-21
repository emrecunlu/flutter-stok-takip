import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:flutter_stok_takip/ui/screens/customer/customer_add_screen/customer_add_screen.dart';
import 'package:flutter_stok_takip/ui/viewmodels/customer/customer_list_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/custom_page_sheet.dart';
import 'package:provider/provider.dart';

class BuildCustomer extends StatelessWidget {
  final CustomerModel customer;

  const BuildCustomer({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          showPageSheet(
            page: CustomerAddScreen(toUpdate: customer),
            context: context,
          ).then(
            (value) => context.read<CustomerListViewModel>().getAllCustomers(),
          );
        },
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text('${customer.firstName} ${customer.lastName}'),
        subtitle: Text('${customer.tcNumber}'),
        trailing: IconButton(
          onPressed: () {
            context.read<CustomerListViewModel>().deleteCustomer(customer.id);
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
