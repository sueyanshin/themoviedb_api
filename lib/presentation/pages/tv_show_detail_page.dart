import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/presentation/providers/tv_shows_provider.dart';
import 'package:test_app/presentation/widgets/cast_card.dart';
import 'package:test_app/presentation/widgets/genre_item.dart';
import 'package:test_app/presentation/widgets/image_banner.dart';
import 'package:test_app/presentation/widgets/season_card.dart';

class TvShowDetailPage extends StatefulWidget {
  const new({required this.id, super.key});
  final int? id;

  @override
  State<TvShowDetailPage> createState() => _TvShowDetailPageState();
}

class _TvShowDetailPageState extends State<TvShowDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TvShowsProvider>().fetchTvShowDetail(widget.id ?? 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Tv Show Details")),
      body: Consumer<TvShowsProvider>(
        builder: (context, provider, child) {
          if (provider.isDetailLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.detailErrorMessage.isNotEmpty) {
            return Center(child: Text(provider.detailErrorMessage));
          }
          final tvShowDetail = provider.tvShowDetail;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ImageBanner(
                  width: double.infinity,
                  height: 200,
                  backdropPath: tvShowDetail.backdropPath.toString(),
                ),
                const SizedBox(height: 20),
                Text(
                  tvShowDetail.name.toString(),
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: .w600,
                  ),
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

                if (tvShowDetail.createdBy != null &&
                    tvShowDetail.createdBy!.isNotEmpty) ...[
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

                if (tvShowDetail.casts != null &&
                    tvShowDetail.casts!.isNotEmpty) ...[
                  Text(
                    "Series Cast",
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: .w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (tvShowDetail.casts != null &&
                      tvShowDetail.casts!.isNotEmpty)
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: .horizontal,
                        itemCount: tvShowDetail.casts!.length,
                        itemBuilder: (context, index) {
                          final cast = tvShowDetail.casts![index];
                          return CastCard(cast: cast);
                        },
                      ),
                    ),

                  const SizedBox(height: 20),
                ],

                Text(
                  "Seasons",
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: .w600,
                  ),
                ),

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
        },
      ),
    );
  }
}
