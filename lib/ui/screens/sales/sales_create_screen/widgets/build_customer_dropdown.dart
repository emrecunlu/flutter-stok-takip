import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:flutter_stok_takip/ui/viewmodels/sales/sales_create_viewmodel.dart';
import 'package:provider/provider.dart';

class BuildCustomerDropdown extends StatelessWidget {
  const BuildCustomerDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SalesCreateViewModel _viewModel =
        context.read<SalesCreateViewModel>();

    return DropdownMenu(
      width: MediaQuery.of(context).size.width - 16,
      label: Text("Müşteri"),
      key: ValueKey(Object.hashAll(_viewModel.customers)),
      onSelected: (value) {
        _viewModel.setSelectedCustomer(value);
      },
      dropdownMenuEntries:
          _viewModel.customers.map<DropdownMenuEntry<CustomerModel>>((e) {
        return DropdownMenuEntry(
          value: e,
          label: '${e.firstName} ${e.lastName}',
        );
      }).toList(),
    );
  }
}
