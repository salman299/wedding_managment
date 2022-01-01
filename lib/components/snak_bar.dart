import 'package:flutter/material.dart';

void  snackBar(text, String? label, VoidCallback? onPressed) => SnackBar(
  content: Text(text),
  action: label != null ? SnackBarAction(
    label: label,
    textColor: Colors.white,
    onPressed: () {},
  ): null,
  behavior: SnackBarBehavior.floating,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
);