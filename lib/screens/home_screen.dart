import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.put(HomeController());

    return Scaffold(
      appBar: _buildAppBar(),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: _homeController.gridItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final _gridItem = _homeController.gridItems[index];

          return Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Get.to(_gridItem.page);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        _gridItem.icon,
                        size: 32,
                      ),
                    ),
                    color: Get.theme.splashColor,
                  ),
                  SizedBox(height: 10),
                  Text(
                    _gridItem.title,
                    style: Get.theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Stok Takip"),
    );
  }
}
