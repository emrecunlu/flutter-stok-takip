import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/models/product/product_model.dart';

class ProductBottomSheet extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ProductBottomSheet({
    super.key,
    required this.product,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(context),
            SizedBox(height: 24),
            _buildEditButton(context),
            SizedBox(height: 5),
            _buildDeleteButton(),
          ],
        ),
      ),
    );
  }

  SizedBox _buildEditButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        label: Text("Düzenle"),
        onPressed: onEdit,
        icon: Icon(
          Icons.edit,
        ),
      ),
    );
  }

  SizedBox _buildDeleteButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        label: Text("Sil"),
        onPressed: onDelete,
        icon: Icon(
          Icons.delete,
        ),
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      product.title,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
