import 'package:dio/dio.dart';
import 'package:themoviedb_dev/domain/api_key_storage.dart';
import 'package:themoviedb_dev/domain/models/movie_model.dart';

class ApiClient {
  final _dio = Dio();

  Future<void> auth() async {
    // TODO: Реализовать опциональную авторизацию
  }

  Future<List<MovieModel>?> getTrends(int page) async {
    final response = await _dio.get(
      'https://api.themoviedb.org/3/movie/now_playing',
      options: Options(
        headers: {
          'accept': Headers.jsonContentType,
          'Authorization': ApiTokenStorage.apiToken,
        },
      ),
      queryParameters: {
        'page': page,
        'language': 'ru-RU',
      },
    );

    if (response.data == null) return null;

    List<MovieModel> selectedPageMoviesResult = [];

    for (var element in (response.data['results'] as List)) {
      var language = element['original_language'];

      // Пока поддержка только ru и en фильмов
      if (language != 'en' && language != 'ru') continue;

      selectedPageMoviesResult.add(MovieModel.fromJson(element));
    }

    return selectedPageMoviesResult;
  }

  Future<List<MovieModel>?> getPopular(int page) async {
    final response = await _dio.get(
      'https://api.themoviedb.org/3/movie/popular',
      options: Options(
        headers: {
          'accept': Headers.jsonContentType,
          'Authorization': ApiTokenStorage.apiToken,
        },
      ),
      queryParameters: {
        'page': page,
        'language': 'ru-RU',
      },
    );

    if (response.data == null) return null;

    List<MovieModel> selectedPageMoviesResult = [];

    for (var element in (response.data['results'] as List)) {
      selectedPageMoviesResult.add(MovieModel.fromJson(element));
    }

    return selectedPageMoviesResult;
  }
}
