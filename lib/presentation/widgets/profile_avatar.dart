import 'package:flutter/material.dart';
import 'package:test_app/presentation/widgets/loading_container.dart';

class ProfileAvatar extends StatelessWidget {
  const new({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 100,
      decoration: BoxDecoration(
        shape: .circle,
        border: .all(color: theme.colorScheme.primary, width: 4),
      ),
      child: ClipRRect(
        borderRadius: .circular(50),
        child: Image.network(
          width: 100,
          height: 100,
          fit: .cover,
          imageUrl,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return LoadingContainer();
          },
          errorBuilder: (context, error, stackTrace) {
            return ImageErrorContainer();
          },
        ),
      ),
    );
  }
}
