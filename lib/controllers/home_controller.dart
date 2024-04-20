import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/base/base_controller.dart';
import 'package:flutter_stok_takip/models/grid_item_model.dart';
import 'package:flutter_stok_takip/screens/customer/customer_create_screen.dart';
import 'package:flutter_stok_takip/screens/customer/customer_list_screen.dart';

class HomeController extends BaseController {
  final List<GridItemModel> _gridItems = [
    GridItemModel(
      title: "Müşteriler",
      icon: Icons.person,
      page: CustomerListScreen(),
    ),
    GridItemModel(
      title: "Müşteri Ekle",
      icon: Icons.person_add,
      page: CustomerCreatePage(),
    )
  ];

  List<GridItemModel> get gridItems => _gridItems;
}
