import 'package:flutter/material.dart';
import 'package:test_app/models/tv_show_detail.dart';
import 'package:test_app/services/api_service.dart';

class SeasonCard extends StatelessWidget {
  const new({required this.season, super.key});

  final Seasons season;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Row(
        children: [
          Image.network(
            width: 80,
            ApiService.imgBaseUrl + season.posterPath.toString(),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(child: CircularProgressIndicator());
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
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: .start,
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
