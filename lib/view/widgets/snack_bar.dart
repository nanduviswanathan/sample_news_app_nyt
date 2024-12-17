import 'package:flutter/material.dart';
import 'package:sample_app_flutter/shared/constants/colors.dart';

void showSnackBar(BuildContext context, String message,
    {Color? backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: backgroundColor ?? kBlackColor,
      duration: const Duration(seconds: 2),
    ),
  );
}
