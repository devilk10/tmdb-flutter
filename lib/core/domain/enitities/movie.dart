class MovieEntity {
  int id;
  String title;
  String overview;
  String posterPath;
  double voteAverage;
  bool liked;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.liked,
  });

  void toggleLiked() {
    liked = !liked;
  }
}
