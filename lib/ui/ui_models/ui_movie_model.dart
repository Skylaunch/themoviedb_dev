import 'package:themoviedb_dev/domain/models/movie_model.dart';

class UIMovieModel {
  UIMovieModel({
    required this.isAdult,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.backdropPath,
    required this.releaseDate,
    required this.title,
    required this.isVideo,
    required this.voteAverage,
    required this.voteCount,
    String posterPath = '',
  }) : _posterPath = posterPath;

  final bool isAdult;

  final String backdropPath;

  final String _posterPath;

  String get posterPath =>
      'https://media.themoviedb.org/t/p/w220_and_h330_face$_posterPath';

  final List<int> genreIds;

  final String originalLanguage;

  final String originalTitle;

  final String overview;

  final double popularity;

  final DateTime releaseDate;

  final String title;

  final bool isVideo;

  final double voteAverage;

  final int voteCount;

  static UIMovieModel from(MovieModel model) {
    return UIMovieModel(
      isAdult: model.adult,
      genreIds: model.genreIds,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      overview: model.overview,
      popularity: model.popularity,
      backdropPath: model.backdropPath,
      releaseDate: model.releaseDate,
      title: model.title,
      isVideo: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      posterPath: model.posterPath,
    );
  }
}
