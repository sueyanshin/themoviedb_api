import 'package:flutter/material.dart';
import 'package:test_app/models/tv_show_detail.dart';
import 'package:test_app/services/api_service.dart';

class SeasonCard extends StatelessWidget {
  const new({required this.season, super.key});

  final Seasons season;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: .circular(12),
      ),
      margin: .only(bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: .only(
              topLeft: .circular(12),
              bottomLeft: .circular(12),
            ),
            child: Image.network(
              width: 100,
              fit: .cover,
              ApiService.imgBaseUrl + season.posterPath.toString(),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  height: 120,
                  width: 100,
                  alignment: .center,
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  width: 100,
                  alignment: .center,
                  color: Colors.grey[200],
                  child: Icon(Icons.broken_image, size: 40),
                );
              },
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            spacing: 4,
            children: [
              Text("${season.name}", style: theme.textTheme.titleMedium),
              Text(
                "${season.episodeCount} Episodes",
                style: theme.textTheme.bodySmall,
              ),
              Text(
                "Premiered on: ${season.airDate}",
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
