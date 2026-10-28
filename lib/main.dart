import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:test_app/config/theme/app_theme.dart';
import 'package:test_app/presentation/pages/home_page.dart';
import 'package:test_app/presentation/providers/movie_provider.dart';
import 'package:test_app/presentation/providers/tv_shows_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieProvider>(
          create: (_) => MovieProvider()..fetchPopularMovies(),
        ),
        ChangeNotifierProvider<TvShowsProvider>(
          create: (_) => TvShowsProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: AppTheme.darkTheme,
      home: HomePage(),
    );
  }
}
