import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/models/product/product_basket_item.dart';

class BuildBasketList extends StatelessWidget {
  final List<ProductBasketItem> basketItems;
  const BuildBasketList({
    super.key,
    required this.basketItems,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: basketItems.length,
      itemBuilder: (context, index) {
        final basketItem = basketItems[index];

        return Card(
          elevation: 0,
          child: ListTile(
            isThreeLine: true,
            title: _buildProductName(basketItem.product.title, context),
            trailing: Text('${basketItem.product.barcodeNumber}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildQuantity(basketItem, context),
                _buildPrice(basketItem, context),
                _buildTotalPrice(basketItem, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Text _buildTotalPrice(ProductBasketItem basketItem, BuildContext context) {
    return Text(
      'Toplam Fiyat: ${(basketItem.quantity * basketItem.product.price).toStringAsFixed(2)}₺',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  Text _buildPrice(ProductBasketItem basketItem, BuildContext context) {
    return Text(
      'Satış Fiyat: ${basketItem.product.price.toStringAsFixed(2)}₺',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  Text _buildQuantity(ProductBasketItem basketItem, BuildContext context) {
    return Text(
      '${basketItem.quantity} Adet',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  Text _buildProductName(String title, BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
