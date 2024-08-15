import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb_dev/domain/data_providers/guest_session_data_provider.dart';
import 'package:themoviedb_dev/helpers/scrollable_movies_sections_helper.dart';
import 'package:themoviedb_dev/ui/ui_models/ui_movie_model.dart';

abstract class GuestSessionEvent {}

class GuestSessionOpenAppEvent implements GuestSessionEvent {}

class LoadNextMoviesPage implements GuestSessionEvent {
  final SelectorType loadingListType;

  final int newPageIndex;

  LoadNextMoviesPage({
    required this.loadingListType,
    required this.newPageIndex,
  });
}

abstract class GuestSessionState {
  final List<UIMovieModel>? thrandMovies;

  final List<UIMovieModel>? popularMovies;

  GuestSessionState({this.thrandMovies, this.popularMovies});
}

class GuestSessionOpenAppSuccess implements GuestSessionState {
  @override
  final List<UIMovieModel>? thrandMovies;

  @override
  final List<UIMovieModel>? popularMovies;

  GuestSessionOpenAppSuccess({this.thrandMovies, this.popularMovies});
}

class GuestSessionOpenAppFailture implements GuestSessionState {
  @override
  final List<UIMovieModel>? thrandMovies;

  @override
  final List<UIMovieModel>? popularMovies;

  GuestSessionOpenAppFailture({this.thrandMovies, this.popularMovies});
}

class GuestSessionOpenAppInitial implements GuestSessionState {
  @override
  final List<UIMovieModel>? thrandMovies;

  @override
  final List<UIMovieModel>? popularMovies;

  GuestSessionOpenAppInitial({this.thrandMovies, this.popularMovies});
}

class GuestSessionBloc extends Bloc<GuestSessionEvent, GuestSessionState> {
  final guestSessionDataProvider = GuestSessionDataProvider();

  GuestSessionBloc() : super(GuestSessionOpenAppInitial()) {
    on((event, emit) async {
      switch (event.runtimeType) {
        case (GuestSessionOpenAppEvent):
          var thrands = await guestSessionDataProvider.getThrandingMovies(1);

          var populars = await guestSessionDataProvider.getPopularMovies(1);
          emit(
            GuestSessionOpenAppSuccess(
              thrandMovies: thrands,
              popularMovies: populars,
            ),
          );
          break;
        case (LoadNextMoviesPage):
          var loadEvent = event as LoadNextMoviesPage;
          var newPageIndex = loadEvent.newPageIndex;

          switch (loadEvent.loadingListType) {
            case (SelectorType.thrand):
              var thrands = await guestSessionDataProvider
                  .getThrandingMovies(newPageIndex);

              emit(
                GuestSessionOpenAppSuccess(
                  thrandMovies: <UIMovieModel>[
                    ...state.thrandMovies ?? [],
                    ...thrands,
                  ],
                  popularMovies: state.popularMovies,
                ),
              );
              break;
            case SelectorType.popular:
              var populars =
                  await guestSessionDataProvider.getPopularMovies(newPageIndex);

              emit(
                GuestSessionOpenAppSuccess(
                  thrandMovies: state.thrandMovies,
                  popularMovies: [
                    ...state.popularMovies ?? [],
                    ...populars,
                  ],
                ),
              );
              break;
            case SelectorType.free:
              // TODO: Реализовать кейс
              break;
          }
      }
    });
  }
}
