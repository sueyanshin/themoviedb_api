import 'package:flutter/material.dart';
import 'package:test_app/models/cast_media_credit.dart';
import 'package:test_app/presentation/pages/movie_detail_page.dart';
import 'package:test_app/presentation/pages/tv_show_detail_page.dart';
import 'package:test_app/presentation/widgets/loading_container.dart';
import 'package:test_app/services/api_service.dart';

class MediaCard extends StatelessWidget {
  const new({super.key, required this.credit});

  final CastMediaCredit credit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMovie = credit.mediaType == "movie" ? true : false;
    return Container(
      margin: .only(right: 10),
      width: 120,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: .circular(12),
      ),
      child: InkWell(
        onTap: () {
          if (isMovie) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MovieDetailPage(id: credit.id);
                },
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TvShowDetailPage(id: credit.id);
                },
              ),
            );
          }
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
                "${ApiService.imgBaseUrl}${credit.backdropPath}",
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Text(
                isMovie ? credit.title.toString() : credit.name.toString(),
                maxLines: 2,
                overflow: .ellipsis,
                style: theme.textTheme.titleSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                isMovie
                    ? credit.releaseDate.toString()
                    : credit.firstAirDate.toString(),
                style: theme.textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
