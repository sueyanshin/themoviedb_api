import 'package:flutter/material.dart';
import 'package:test_app/models/tv_show.dart';
import 'package:test_app/presentation/pages/tv_show_detail_page.dart';
import 'package:test_app/services/api_service.dart';

class TvShowCard extends StatelessWidget {
  const new({super.key, required this.tvShow});

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: SizedBox(
        width: 120,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TvShowDetailPage(id: tvShow.id);
                },
              ),
            );
          },
          child: Column(
            crossAxisAlignment: .start,
            children: [
              ClipRRect(
                borderRadius: .circular(12),
                child: Image.network(
                  "${ApiService.imgBaseUrl}${tvShow.backdropPath}",
                  width: 120,
                  height: 100,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(child: const CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      alignment: .center,
                      color: Colors.grey[200],
                      child: Icon(Icons.broken_image, size: 40),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8,
                ),
                child: Text(
                  tvShow.name.toString(),
                  maxLines: 2,
                  overflow: .ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  tvShow.firstAirDate.toString(),
                  style: theme.textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
