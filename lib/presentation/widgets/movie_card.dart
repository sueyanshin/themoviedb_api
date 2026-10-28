import 'package:flutter/material.dart';
import 'package:test_app/models/movie.dart';
import 'package:test_app/presentation/pages/movie_detail_page.dart';
import 'package:test_app/presentation/widgets/loading_container.dart';
import 'package:test_app/services/api_service.dart';

class MovieCard extends StatelessWidget {
  const new({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: .only(right: 10),
      width: 120,
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
                return MovieDetailPage(id: movie.id);
              },
            ),
          );
        },
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ClipRRect(
              borderRadius: .only(
                topRight: .circular(12),
                topLeft: .circular(12),
              ),
              child: Image.network(
                "${ApiService.imgBaseUrl}${movie.backdropPath}",
                width: 120,
                height: 100,
                fit: BoxFit.cover,

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
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Text(
                movie.title.toString(),
                maxLines: 2,
                overflow: .ellipsis,
                style: theme.textTheme.titleSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                movie.releaseDate.toString(),
                style: theme.textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
