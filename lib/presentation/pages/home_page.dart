import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/movie.dart';
import 'package:test_app/models/tv_show.dart';
import 'package:test_app/presentation/widgets/movie_card.dart';
import 'package:test_app/presentation/widgets/tv_show_card.dart';
import 'package:test_app/services/api_service.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> _movieList;
  late Future<List<TvShow>> _tvShowList;

  @override
  void initState() {
    super.initState();
    final apiService = context.read<ApiService>();
    _movieList = apiService.fetchPopularMovies();
    _tvShowList = apiService.fetchPopularSeries();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Movie App")),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('Popular Movies', style: theme.textTheme.titleMedium),
            SizedBox(height: 20),
            FutureBuilder<List<Movie>>(
              future: _movieList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error} occurred"));
                } else if (snapshot.hasData) {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final movie = snapshot.data![index];
                        return MovieCard(movie: movie);
                      },
                    ),
                  );
                } else {
                  return const Center(child: Text("No movie available."));
                }
              },
            ),
            const SizedBox(height: 20),

            Text('Popular TV Shows', style: theme.textTheme.titleMedium),
            SizedBox(height: 20),

            FutureBuilder(
              future: _tvShowList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error} occurred"));
                } else if (snapshot.hasData) {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final tvShow = snapshot.data![index];
                        return TvShowCard(tvShow: tvShow);
                      },
                    ),
                  );
                } else {
                  return const Center(child: Text("No TV shows available"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
