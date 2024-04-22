import 'package:flutter/material.dart';

class BuildBasketItems extends StatelessWidget {
  const BuildBasketItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildListTile(context),
      ],
    );
  }

  ListTile _buildListTile(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      subtitle: _buildSubtitle(context),
      title: _buildTitle(context),
      trailing: _buildAddProductIcon(context),
    );
  }

  IconButton _buildAddProductIcon(BuildContext context) {
    return IconButton.outlined(
      onPressed: () {},
      icon: Icon(Icons.add),
    );
  }

  Text _buildSubtitle(BuildContext context) {
    return Text(
      "Düzeltmek için dokunun.",
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      "Ürünler",
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
