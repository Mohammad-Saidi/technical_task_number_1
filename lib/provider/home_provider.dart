import 'package:flutter/material.dart';

import '../model/movie_model.dart';

class HomeProvider with ChangeNotifier {
  String selectedCategory = "All";
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void selectCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  List<Movie> trendingMovies = [
    Movie(
        title: 'Yes I Do',
        imageUrl: 'assets/images/trending_movies_1.png',
        hasEpisode: false),
    Movie(
        title: 'Cartoon',
        imageUrl: 'assets/images/trending_movie_2.png',
        hasEpisode: false),
    Movie(
        title: 'Babylon',
        imageUrl: 'assets/images/trending_movie_3.png',
        hasEpisode: false),
    Movie(
        title: 'Yes I Do',
        imageUrl: 'assets/images/trending_movies_1.png',
        hasEpisode: false),
    Movie(
        title: 'Cartoon',
        imageUrl: 'assets/images/trending_movie_2.png',
        hasEpisode: false),
    Movie(
        title: 'Babylon',
        imageUrl: 'assets/images/trending_movie_3.png',
        hasEpisode: false),
    Movie(
        title: 'Yes I Do',
        imageUrl: 'assets/images/trending_movies_1.png',
        hasEpisode: false),
    Movie(
        title: 'Cartoon',
        imageUrl: 'assets/images/trending_movie_2.png',
        hasEpisode: false),
    Movie(
        title: 'Babylon',
        imageUrl: 'assets/images/trending_movie_3.png',
        hasEpisode: false),
  ];

  List<Movie> continueWatchingMovies = [
    Movie(
        title: 'Wednesday',
        imageUrl: 'assets/images/continue_watching_movie_1.png',
        hasEpisode: true,
        seasonName: 'Season - 1 | Episode - 3',
        movieProgress: 0.7),
    Movie(
        title: 'Emily in Paris',
        imageUrl: 'assets/images/continue_watching_movie_2.png',
        hasEpisode: true,
        seasonName: 'Season - 1 | Episode - 5',
        movieProgress: 0.4),
    Movie(
        title: 'Wednesday',
        imageUrl: 'assets/images/continue_watching_movie_1.png',
        hasEpisode: true,
        seasonName: 'Season - 1 | Episode - 3',
        movieProgress: 0.4),
    Movie(
        title: 'Emily in Paris',
        imageUrl: 'assets/images/continue_watching_movie_2.png',
        hasEpisode: true,
        seasonName: 'Season - 1 | Episode - 5',
        movieProgress: 0.8),
    Movie(
        title: 'Wednesday',
        imageUrl: 'assets/images/continue_watching_movie_1.png',
        hasEpisode: true,
        seasonName: 'Season - 1 | Episode - 3',
        movieProgress: 0.7),
    Movie(
        title: 'Emily in Paris',
        imageUrl: 'assets/images/continue_watching_movie_2.png',
        hasEpisode: true,
        seasonName: 'Season - 1 | Episode - 5',
        movieProgress: 0.4),
  ];

  List<Movie> recommendedMovies = [
    Movie(
        title: 'Double Love',
        imageUrl: 'assets/images/recommended_movie_1.png',
        hasEpisode: false),
    Movie(
        title: 'Sunita',
        imageUrl: 'assets/images/recommended_movie_2.png',
        hasEpisode: false),
    Movie(
        title: 'Pokemon',
        imageUrl: 'assets/images/recommended_movie_3.png',
        hasEpisode: false),
    Movie(
        title: 'Double Love',
        imageUrl: 'assets/images/recommended_movie_1.png',
        hasEpisode: false),
    Movie(
        title: 'Sunita',
        imageUrl: 'assets/images/recommended_movie_2.png',
        hasEpisode: false),
    Movie(
        title: 'Pokemon',
        imageUrl: 'assets/images/recommended_movie_3.png',
        hasEpisode: false),
    Movie(
        title: 'Double Love',
        imageUrl: 'assets/images/recommended_movie_1.png',
        hasEpisode: false),
    Movie(
        title: 'Sunita',
        imageUrl: 'assets/images/recommended_movie_2.png',
        hasEpisode: false),
    Movie(
        title: 'Pokemon',
        imageUrl: 'assets/images/recommended_movie_3.png',
        hasEpisode: false),
  ];
}
