class Movie {
  final String title;
  final String imageUrl;
  final bool hasEpisode;
  final String? seasonName;

  Movie(
      {required this.title,
      required this.imageUrl,
      required this.hasEpisode,
      this.seasonName});
}
