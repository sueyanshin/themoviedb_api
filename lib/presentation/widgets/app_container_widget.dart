import 'package:flutter/material.dart';

class AppContainerWidget extends StatelessWidget {
  const new({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        borderRadius: .circular(12),
        color: theme.colorScheme.surfaceContainer,
      ),
      child: child,
    );
  }
}
