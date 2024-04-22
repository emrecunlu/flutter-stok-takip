import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/models/product/product_model.dart';
import 'package:flutter_stok_takip/ui/screens/product/product_list_screen/widget/build_product.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_create_screen/widgets/quantity_picker.dart';

class BuildProductList extends StatelessWidget {
  final List<ProductModel> products;
  final Function(ProductModel product, int quantity) onSubmit;
  const BuildProductList({
    super.key,
    required this.products,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            return BuildProduct(
              product: products[index],
              onTap: () {
                showNumberPicker(products[index], context);
              },
            );
          },
        ),
      ),
    );
  }

  void showNumberPicker(ProductModel product, BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return QuantityPicker(
          stockAmount: product.stockQuantity,
          onSelect: (quantity) {
            onSubmit(product, quantity);
          },
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Ürünler"),
    );
  }
}
