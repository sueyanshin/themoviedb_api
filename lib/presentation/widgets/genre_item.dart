import 'package:flutter/material.dart';

class GenreItem extends StatelessWidget {
  const new({super.key, required this.genre});

  final String genre;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: .all(8),
      decoration: BoxDecoration(
        borderRadius: .circular(20),
        color: theme.colorScheme.surfaceContainer,
      ),

      child: Text(genre.toString(), style: theme.textTheme.labelSmall),
    );
  }
}
