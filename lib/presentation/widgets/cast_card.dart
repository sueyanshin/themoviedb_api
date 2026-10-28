import 'package:flutter/material.dart';
import 'package:test_app/models/cast.dart';
import 'package:test_app/presentation/pages/cast_detail_page.dart';
import 'package:test_app/presentation/widgets/loading_container.dart';
import 'package:test_app/services/api_service.dart';

class CastCard extends StatelessWidget {
  const new({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 120,
      margin: .only(right: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: .circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CastDetailPage(id: cast.id ?? 0);
              },
            ),
          );
        },
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ClipRRect(
              borderRadius: .only(
                topLeft: .circular(12),
                topRight: .circular(12),
              ),
              child: Image.network(
                "${ApiService.imgBaseUrl}${cast.profilePath}",
                width: 120,
                height: 140,
                fit: BoxFit.cover,

                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return LoadingContainer(height: 140);
                },
                errorBuilder: (context, error, stackTrace) {
                  return ImageErrorContainer(height: 140);
                },
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Text(
                cast.name.toString(),
                maxLines: 2,
                overflow: .ellipsis,
                style: theme.textTheme.titleSmall,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 8,
                ),
                child: Text(
                  overflow: .ellipsis,
                  maxLines: 2,
                  cast.character.toString(),
                  style: theme.textTheme.labelSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
