import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/tv_show_detail.dart';
import 'package:test_app/presentation/widgets/genre_item.dart';
import 'package:test_app/presentation/widgets/image_banner.dart';
import 'package:test_app/presentation/widgets/season_card.dart';
import 'package:test_app/services/api_service.dart';

class TvShowDetailPage extends StatefulWidget {
  const new({required this.id, super.key});
  final int? id;

  @override
  State<TvShowDetailPage> createState() => _TvShowDetailPageState();
}

class _TvShowDetailPageState extends State<TvShowDetailPage> {
  late Future<TvShowDetail> _tvShowDetail;
  @override
  void initState() {
    super.initState();
    _tvShowDetail = context.read<ApiService>().fetchTvShowDetail(
      widget.id ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Tv Show Details")),
      body: FutureBuilder(
        future: _tvShowDetail,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final tvShowDetail = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  ImageBanner(
                    width: double.infinity,
                    height: 200,
                    backdropPath: tvShowDetail!.backdropPath.toString(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    tvShowDetail.name.toString(),
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),

                  if (tvShowDetail.genres != null)
                    Wrap(
                      spacing: 4,
                      children: tvShowDetail.genres!.map((genre) {
                        return GenreItem(genre: genre.name.toString());
                      }).toList(),
                    ),
                  const SizedBox(height: 20),
                  Text(
                    tvShowDetail.overview.toString(),
                    style: theme.textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 10),

                  if (tvShowDetail.createdBy != null) ...[
                    Text("Created by", style: theme.textTheme.labelMedium),
                    Wrap(
                      direction: .vertical,
                      children: tvShowDetail.createdBy!.map((creator) {
                        return Text(
                          creator.name.toString(),
                          style: theme.textTheme.labelMedium,
                        );
                      }).toList(),
                    ),
                  ],

                  const SizedBox(height: 20),

                  Text("Seasons", style: theme.textTheme.titleMedium),

                  const SizedBox(height: 20),

                  if (tvShowDetail.seasons != null)
                    Wrap(
                      children: tvShowDetail.seasons!.map((season) {
                        return SeasonCard(season: season);
                      }).toList(),
                    ),
                ],
              ),
            );
          } else {
            return const Text('No TV show data available');
          }
        }),
      ),
    );
  }
}
