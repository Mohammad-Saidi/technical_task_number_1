import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../model/movie_model.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Action",
    "Anime",
    "Sci-fi",
    "Thriller",
  ];

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFF11161F),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0), // Padding around bottom bar
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30), // Circular edges
          child: BottomAppBar(
            color: Color(0xFF1C212A),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navIcon(Icons.home_outlined, isSelected: true),
                navIcon(Icons.tv),
                navIcon(Icons.download),
                navIcon(Icons.person),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Rafsan",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Let’s watch today',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                  Image.asset('assets/images/profile.png',
                      height: 100, width: 100),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 20),
                        hintText: "Search",
                        hintStyle: GoogleFonts.akatab(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(Icons.search, color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_card_sharp, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),
              sectionHeader('Categories'),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    bool isSelected = homeProvider.selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ChoiceChip(
                        label: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white70,
                          ),
                        ),
                        selected: isSelected,
                        backgroundColor: Colors.black,
                        selectedColor: Colors.red,
                        onSelected: (_) =>
                            homeProvider.selectCategory(category),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 164,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/banner_image_1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              sectionHeader('Trending Movies'),
              SizedBox(height: 10),
              movieList(homeProvider.trendingMovies, false),
              SizedBox(height: 10),
              sectionHeader('Continue Watching'),
              SizedBox(height: 10),
              movieList(homeProvider.continueWatchingMovies, true),
              SizedBox(height: 10),
              sectionHeader('Recommended For You'),
              SizedBox(height: 10),
              movieList(homeProvider.recommendedMovies, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget navIcon(IconData icon, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Icon(icon, color: isSelected ? Colors.red : Colors.grey),
    );
  }

  Widget sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.akatab(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        Text(
          "See More",
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget movieList(List<Movie> movies, bool isContinueWatchingMovie) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          if (isContinueWatchingMovie) {
            return continueWatchingMovieItem(movies[index]);
          } else {
            return movieItem(movies[index]);
          }
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 15);
        },
      ),
    );
  }

  Widget movieItem(Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 115,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(movie.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(movie.title,
            style: GoogleFonts.akatab(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white)),
      ],
    );
  }

  Widget continueWatchingMovieItem(Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(movie.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(movie.title,
            style: GoogleFonts.akatab(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white)),
        Visibility(
          visible: movie.hasEpisode,
          child: Text(movie.seasonName ?? '',
              style: GoogleFonts.akatab(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white)),
        ),
      ],
    );
  }
}
