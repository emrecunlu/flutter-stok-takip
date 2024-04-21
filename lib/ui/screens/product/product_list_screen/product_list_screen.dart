import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_view.dart';
import 'package:flutter_stok_takip/ui/screens/product/product_list_screen/widget/build_product.dart';
import 'package:flutter_stok_takip/ui/screens/product/product_list_screen/widget/product_bottom_sheet.dart';
import 'package:flutter_stok_takip/ui/viewmodels/product/product_list_viewmodel.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (model) {
        model.getAllProducts();
      },
      model: ProductListViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Padding(
            padding: EdgeInsets.all(8),
            child: _buildGridView(model),
          ),
        );
      },
    );
  }

  GridView _buildGridView(ProductListViewModel model) {
    return GridView.builder(
      itemCount: model.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 200,
      ),
      itemBuilder: (context, index) {
        return BuildProduct(
          product: model.products[index],
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ProductBottomSheet(
                product: model.products[index],
              ),
            );
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
