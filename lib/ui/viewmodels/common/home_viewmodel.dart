import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_viewmodel.dart';
import 'package:flutter_stok_takip/core/models/common/home_item_model.dart';
import 'package:flutter_stok_takip/ui/screens/customer/customer_add_screen/customer_add_screen.dart';
import 'package:flutter_stok_takip/ui/screens/customer/customer_list_screen/customer_list_screen.dart';
import 'package:flutter_stok_takip/ui/screens/product/product_create_screen/product_create_screen.dart';
import 'package:flutter_stok_takip/ui/screens/product/product_list_screen/product_list_screen.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_create_screen/sales_create_screen.dart';
import 'package:flutter_stok_takip/ui/screens/sales/sales_list_screen/sales_list_screen.dart';

class HomeViewModel extends BaseViewModel {
  final List<HomeItemModel> _pages = [
    HomeItemModel(
      title: "Müşteriler",
      icon: Icons.person,
      page: CustomerListScreen(),
    ),
    HomeItemModel(
      title: "Müşteri Ekle",
      icon: Icons.person_add,
      page: CustomerAddScreen(),
    ),
    HomeItemModel(
      title: "Ürünler",
      icon: Icons.note,
      page: ProductListScreen(),
    ),
    HomeItemModel(
      title: "Ürün Ekle",
      icon: Icons.note_add,
      page: ProductCreateScreen(),
    ),
    HomeItemModel(
      title: "Satışlar",
      icon: Icons.sell,
      page: SalesListScreen(),
    ),
    HomeItemModel(
      title: "Satış Ekle",
      icon: Icons.add,
      page: SalesCreateScreen(),
    )
  ];

  List<HomeItemModel> get pages => _pages;
}
