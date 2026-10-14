import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/presentation/providers/movie_provider.dart';
import 'package:test_app/presentation/widgets/genre_item.dart';
import 'package:test_app/presentation/widgets/icon_with_label.dart';
import 'package:test_app/presentation/widgets/image_banner.dart';

class MovieDetailPage extends StatefulWidget {
  const new({required this.id, super.key});
  final int? id;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieProvider>().fetchMovieDetail(widget.id ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Movie Details")),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.isMovieDetailLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.movieDetailErrorMessage.isNotEmpty) {
            return Center(child: Text(provider.movieDetailErrorMessage));
          }
          final movie = provider.movieDetail;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ImageBanner(
                  width: double.infinity,
                  height: 200,
                  backdropPath: movie.backdropPath.toString(),
                ),
                const SizedBox(height: 20),
                Text(movie.title.toString(), style: theme.textTheme.titleLarge),
                const SizedBox(height: 10),

                if (movie.genres != null)
                  Wrap(
                    spacing: 4,
                    children: movie.genres!.map((genre) {
                      return GenreItem(genre: genre.name.toString());
                    }).toList(),
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    IconWithLabel(
                      label: movie.voteAverage.toString(),
                      icon: Icon(Icons.favorite, color: Colors.red),
                    ),
                    IconWithLabel(
                      label: "${movie.runtime.toString()} min",
                      icon: Icon(Icons.watch_later_outlined),
                    ),
                    IconWithLabel(
                      label: movie.releaseDate.toString(),
                      icon: Icon(Icons.date_range),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  movie.overview.toString(),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
