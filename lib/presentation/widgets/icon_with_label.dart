import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {
  const new({super.key, required this.label, required this.icon});

  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        icon,
        Text(label, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}
