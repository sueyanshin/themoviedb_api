import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/presentation/pages/home_page.dart';
import 'package:test_app/presentation/providers/movie_provider.dart';
import 'package:test_app/presentation/providers/tv_shows_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieProvider>(create: (_) => MovieProvider()),
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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: HomePage(),
    );
  }
}
