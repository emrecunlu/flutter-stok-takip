import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/models/product/product_model.dart';

class BuildProduct extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const BuildProduct({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).focusColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTitle(context),
                    _buildPrice(context),
                    _buildStock(context)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _buildStock(BuildContext context) {
    return Text(
      "${product.stockQuantity} adet",
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Text _buildPrice(BuildContext context) {
    return Text(
      product.price.toStringAsFixed(2) + '₺',
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      product.title,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }

  ClipRRect _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: Image.asset(
        "assets/images/empty.jpeg",
        fit: BoxFit.cover,
        height: 110,
        width: double.infinity,
      ),
    );
  }
}
