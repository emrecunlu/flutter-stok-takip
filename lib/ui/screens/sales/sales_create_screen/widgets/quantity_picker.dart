import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_widget.dart';
import 'package:flutter_stok_takip/core/services/navigation_service.dart';
import 'package:numberpicker/numberpicker.dart';

class QuantityPicker extends StatefulWidget {
  final int stockAmount;
  final Function(int quantity) onSelect;
  const QuantityPicker(
      {super.key, required this.stockAmount, required this.onSelect});

  @override
  State<QuantityPicker> createState() => _QuantityPickerState();
}

class _QuantityPickerState extends BaseWidget<QuantityPicker> {
  late int quantity;

  @override
  void initState() {
    quantity = widget.stockAmount == 0 ? 0 : 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .35,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTitle(context),
          verticalMargin(16),
          _buildNumberPicker(),
          verticalMargin(16),
          _buildSubmitButton()
        ],
      ),
    );
  }

  SizedBox _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.tonal(
        onPressed: () {
          widget.onSelect(quantity);
          NavigationService.goBack();
        },
        child: Text("Seç"),
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      "Miktar Seçiniz:",
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Expanded _buildNumberPicker() {
    return Expanded(
      child: NumberPicker(
        infiniteLoop: true,
        haptics: true,
        minValue: widget.stockAmount == 0 ? 0 : 1,
        maxValue: widget.stockAmount,
        value: quantity,
        onChanged: (value) {
          setState(() {
            quantity = value;
          });
        },
      ),
    );
  }
}
