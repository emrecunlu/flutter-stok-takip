import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/models/sales/sales_model.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_list_screen/widgets/build_basket_list.dart';
import 'package:intl/intl.dart';

class BuildSale extends StatelessWidget {
  final SalesModel sales;
  const BuildSale({
    super.key,
    required this.sales,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        shape: Border.fromBorderSide(BorderSide.none),
        title: _buildCustomerName(context),
        childrenPadding: EdgeInsets.all(8),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTotalPrice(),
            _buildSalesDate(context),
          ],
        ),
        children: [
          BuildBasketList(basketItems: sales.products),
        ],
      ),
    );
  }

  Text _buildSalesDate(BuildContext context) {
    return Text(
      'Tarih: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(sales.date)}',
      style: TextStyle(
        fontSize: 13,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  Text _buildTotalPrice() {
    return Text('Toplam Tutar: ${sales.totalPrice}₺',
        style: TextStyle(fontWeight: FontWeight.w600));
  }

  Text _buildCustomerName(BuildContext context) {
    return Text('${sales.customer.firstName} ${sales.customer.lastName}',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        overflow: TextOverflow.ellipsis);
  }
}
