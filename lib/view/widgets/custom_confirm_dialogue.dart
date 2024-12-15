import 'package:flutter/material.dart';

Future<void> showConfirmationDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirm,
    required String cancelText,
    required String confirmText}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              onConfirm(); // Call the confirmation callback
            },
            child: Text(confirmText),
          ),
        ],
      );
    },
  );
}
