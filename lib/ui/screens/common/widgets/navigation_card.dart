import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_widget.dart';
import 'package:flutter_stok_takip/core/models/common/home_item_model.dart';
import 'package:flutter_stok_takip/core/services/navigation_service.dart';

class NavigationCard extends StatefulWidget {
  final HomeItemModel homeItemModel;

  const NavigationCard({super.key, required this.homeItemModel});

  @override
  State<NavigationCard> createState() => _NavigationCardState();
}

class _NavigationCardState extends BaseWidget<NavigationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          NavigationService.push(widget.homeItemModel.page);
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(),
            verticalMargin(16),
            _buildTitle(),
          ],
        ),
      ),
    );
  }

  Text _buildTitle() => Text(
        widget.homeItemModel.title,
        style: themeData.textTheme.bodyLarge,
      );

  Card _buildIcon() {
    return Card(
      color: themeData.hoverColor,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Icon(
          widget.homeItemModel.icon,
          size: 32,
        ),
      ),
    );
  }
}
