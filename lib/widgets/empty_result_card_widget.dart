import 'package:flutter/material.dart';

Widget emptyResultCard(BuildContext context, String title, {String? message}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        //      height: 200,
        width: 450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //color: Theme.of(context).colorScheme.errorContainer,
          color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              //Text(message ?? "", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    ),
  );
}
