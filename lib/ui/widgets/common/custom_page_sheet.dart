import 'package:flutter/material.dart';

Future showPageSheet({
  required Widget page,
  required BuildContext context,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => page,
    barrierColor: Colors.transparent,
    useSafeArea: true,
    enableDrag: false,
    showDragHandle: false,
    isDismissible: false,
    isScrollControlled: true,
  );
}
