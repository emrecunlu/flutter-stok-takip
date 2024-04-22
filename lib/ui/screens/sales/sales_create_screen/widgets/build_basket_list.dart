import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/ui/viewmodels/sales/sales_create_viewmodel.dart';
import 'package:provider/provider.dart';

class BuildBasketList extends StatelessWidget {
  const BuildBasketList({super.key});

  @override
  Widget build(BuildContext context) {
    final SalesCreateViewModel _viewModel =
        context.read<SalesCreateViewModel>();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: _viewModel.basketItems.length,
      itemBuilder: (context, index) {
        final item = _viewModel.basketItems[index];

        return Dismissible(
          key: Key(index.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            alignment: AlignmentDirectional.centerEnd,
            child: Icon(Icons.delete),
          ),
          onDismissed: (direction) {
            _viewModel.removeBasketItem(index);
          },
          child: Card(
            margin: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 5,
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRow(
                    title: item.product.title,
                    subtitle: item.product.price.toStringAsPrecision(2) + '₺',
                  ),
                  _buildRow(
                    title: "Miktar",
                    subtitle: item.quantity.toString(),
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  _buildRow(
                    title: "Toplam",
                    subtitle: (item.quantity * item.product.price)
                            .toStringAsFixed(2) +
                        '₺',
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRow(
      {required String title,
      required String subtitle,
      CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            "${title}",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text("${subtitle}"),
        ],
      ),
    );
  }
}
