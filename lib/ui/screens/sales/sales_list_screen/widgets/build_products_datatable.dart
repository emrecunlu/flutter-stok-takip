import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/models/product/product_basket_item.dart';

class BuildProductsDatatable extends StatelessWidget {
  final List<ProductBasketItem> basketItem;
  const BuildProductsDatatable({
    super.key,
    required this.basketItem,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: TableBorder.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.35),
        ),
        columns: _generateDataColumns(),
        rows: _generateDataRows(),
      ),
    );
  }

  List<DataColumn> _generateDataColumns() {
    return [
      DataColumn(label: Expanded(child: Text("Ürün"))),
      DataColumn(label: Expanded(child: Text("Barkod"))),
      DataColumn(label: Expanded(child: Text("Miktar"))),
      DataColumn(label: Expanded(child: Text("Satış Fiyat"))),
    ];
  }

  List<DataRow> _generateDataRows() {
    return basketItem
        .map(
          (e) => DataRow(
            cells: [
              DataCell(
                Text(
                  "${e.product.title}",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              DataCell(Text("${e.product.barcodeNumber}")),
              DataCell(Text("${e.quantity.toStringAsFixed(2)}")),
              DataCell(Text("${e.product.price.toStringAsFixed(2)}₺"))
            ],
          ),
        )
        .toList();
  }
}
