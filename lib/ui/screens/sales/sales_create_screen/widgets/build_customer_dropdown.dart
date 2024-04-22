import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:flutter_stok_takip/ui/viewmodels/sales/sales_create_viewmodel.dart';
import 'package:provider/provider.dart';

class BuildCustomerDropdown extends StatelessWidget {
  final List<CustomerModel> customers;
  const BuildCustomerDropdown({
    super.key,
    required this.customers,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<CustomerModel>(
      key: ValueKey(Object.hashAll(customers)),
      width: MediaQuery.of(context).size.width,
      enableSearch: false,
      enableFilter: false,
      requestFocusOnTap: true,
      label: Text("Müşteri"),
      onSelected: (value) {
        FocusScope.of(context).unfocus();
        context.read<SalesCreateViewModel>().setSelectedCustomer(value);
      },
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Theme.of(context).focusColor,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
      ),
      dropdownMenuEntries:
          customers.map<DropdownMenuEntry<CustomerModel>>((customer) {
        return DropdownMenuEntry(
          value: customer,
          leadingIcon: Icon(Icons.person),
          label: '${customer.firstName} ${customer.lastName}',
        );
      }).toList(),
    );
  }
}
