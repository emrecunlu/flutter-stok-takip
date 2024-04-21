import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_viewmodel.dart';
import 'package:flutter_stok_takip/core/models/common/home_item_model.dart';
import 'package:flutter_stok_takip/ui/screens/customer/customer_add_screen/customer_add_screen.dart';
import 'package:flutter_stok_takip/ui/screens/customer/customer_list_screen/customer_list_screen.dart';

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
  ];

  List<HomeItemModel> get pages => _pages;
}
