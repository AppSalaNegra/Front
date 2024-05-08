import 'package:flutter/material.dart';

class CatButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CatButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}