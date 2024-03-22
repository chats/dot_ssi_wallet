import 'package:flutter/material.dart';

class SnackbarHelper {
  static void showSnackbar(BuildContext context, String message,
      {Color? textColor, Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
      ),
      backgroundColor: backgroundColor ?? Colors.orange,
    ));
  }
}
