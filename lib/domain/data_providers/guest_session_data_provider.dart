import 'package:themoviedb_dev/domain/api_client/api_client.dart';
import 'package:themoviedb_dev/ui/ui_models/ui_movie_model.dart';

class GuestSessionDataProvider {
  final _apiClient = ApiClient();
  Future<List<UIMovieModel>> getThrandingMovies(int page) async {
    final movieApiModels = await _apiClient.getTrends(page);
    var movieUIModels = movieApiModels
        ?.map((model) => UIMovieModel.from(model))
        .toList() as List<UIMovieModel>;

    return movieUIModels;
  }

  // final _apiClient = ApiClient();
  Future<List<UIMovieModel>> getPopularMovies(int page) async {
    final movieApiModels = await _apiClient.getPopular(page);
    var movieUIModels = movieApiModels
        ?.map((model) => UIMovieModel.from(model))
        .toList() as List<UIMovieModel>;

    return movieUIModels;
  }
}
