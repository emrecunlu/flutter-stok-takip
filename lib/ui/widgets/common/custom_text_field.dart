import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_widget.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.placeholder,
    this.controller,
    this.validator,
    this.textInputType = TextInputType.text,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends BaseWidget<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {});

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      minLines: widget.textInputType == TextInputType.multiline ? 3 : 1,
      maxLines: widget.textInputType == TextInputType.multiline ? 6 : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: themeData.focusColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: widget.label,
        hintText: widget.placeholder,
        contentPadding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        suffixIcon: isFocused
            ? IconButton(
                onPressed: () {
                  widget.controller?.clear();
                },
                icon: Icon(Icons.clear),
              )
            : null,
      ),
      validator: widget.validator,
    );
  }
}
