import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/presentation/providers/movie_provider.dart';
import 'package:test_app/presentation/providers/tv_shows_provider.dart';
import 'package:test_app/presentation/widgets/movie_card.dart';
import 'package:test_app/presentation/widgets/tv_show_card.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Movie App")),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Popular Movies',
              style: theme.textTheme.titleMedium!.copyWith(fontWeight: .w600),
            ),
            SizedBox(height: 20),
            Consumer<MovieProvider>(
              builder: (context, movieProvider, child) {
                if (movieProvider.isPopularMovieLoading) {
                  return Container(
                    height: 200,
                    alignment: .center,
                    child: CircularProgressIndicator(),
                  );
                }
                if (movieProvider.popularMovies.isEmpty) {
                  return Container(
                    height: 200,
                    alignment: .center,

                    child: Text('Movies not found'),
                  );
                }

                if (movieProvider.popularMoviesErrorMessage.isNotEmpty) {
                  return Text(
                    movieProvider.popularMoviesErrorMessage.toString(),
                  );
                }

                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieProvider.popularMovies.length,
                    itemBuilder: (context, index) {
                      final movie = movieProvider.popularMovies[index];
                      return MovieCard(movie: movie);
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            Text(
              'Popular TV Shows',
              style: theme.textTheme.titleMedium!.copyWith(fontWeight: .w600),
            ),
            SizedBox(height: 20),
            Consumer<TvShowsProvider>(
              builder: (context, tvShowsProvider, child) {
                if (tvShowsProvider.isTvShowsLoading) {
                  return Container(
                    height: 200,
                    alignment: .center,
                    child: CircularProgressIndicator(),
                  );
                }
                if (tvShowsProvider.tvShows.isEmpty) {
                  return Container(
                    height: 200,
                    alignment: .center,
                    child: Text('TV shows not found'),
                  );
                }

                if (tvShowsProvider.tvShowsErrorMessage.isNotEmpty) {
                  return Text(tvShowsProvider.tvShowsErrorMessage.toString());
                }

                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tvShowsProvider.tvShows.length,
                    itemBuilder: (context, index) {
                      final tvShow = tvShowsProvider.tvShows[index];
                      return TvShowCard(tvShow: tvShow);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
