import 'package:flutter/material.dart';

class BuildSubmitButon extends StatelessWidget {
  final bool? isUpdate;
  final void Function()? onPressed;
  const BuildSubmitButon({super.key, this.isUpdate, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(isUpdate == null ? Icons.save : Icons.refresh),
        label: Text(isUpdate == null ? 'Kaydet' : 'Güncelle'),
      ),
    );
  }
}
