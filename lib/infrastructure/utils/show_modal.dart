import 'package:flutter/material.dart';

showModal(BuildContext context, Widget widget, {bool isDismissible = true}) {
  showModalBottomSheet(
      isDismissible: isDismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (_) => widget);
}
