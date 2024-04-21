import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_view.dart';
import 'package:flutter_stok_takip/core/base/base_widget.dart';
import 'package:flutter_stok_takip/ui/screens/common/widgets/navigation_card.dart';
import 'package:flutter_stok_takip/ui/viewmodels/common/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseWidget<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, model, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildGridView(model),
        );
      },
      model: HomeViewModel(),
    );
  }

  GridView _buildGridView(HomeViewModel model) {
    return GridView.builder(
      itemCount: model.pages.length,
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => NavigationCard(
        homeItemModel: model.pages[index],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Stok Takip"),
    );
  }
}
