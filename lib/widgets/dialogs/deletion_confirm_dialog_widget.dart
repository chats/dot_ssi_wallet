import 'package:flutter/material.dart';

class DeletionConfirmDialog extends StatelessWidget {
  const DeletionConfirmDialog(
      {super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete this credential?'),
      content: const Text('This action cannot be undone.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
