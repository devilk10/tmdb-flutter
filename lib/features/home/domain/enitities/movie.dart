class MovieEntity {
  int id;
  String title;
  String overview;
  String posterPath;
  double voteAverage;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
  });
}
