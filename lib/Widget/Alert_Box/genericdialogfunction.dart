import 'package:flutter/material.dart';

void showCustomDialog({
  required BuildContext context,
  required Widget dialogContent,
  double width = 600,
  double height = 300,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: dialogContent,
        ),
      );
    },
  );
}
