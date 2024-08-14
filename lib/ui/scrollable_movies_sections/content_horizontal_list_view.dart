import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb_dev/bloc/guest_session_bloc.dart';
import 'package:themoviedb_dev/ui/scrollable_movies_sections/image_shower.dart';
import 'package:themoviedb_dev/ui/scrollable_movies_sections/scrollable_movies_sections_helpers/scrollable_movies_sections_helper.dart';
import 'package:themoviedb_dev/ui/ui_models/ui_movie_model.dart';

class ContentHorizontalListView extends StatelessWidget {
  const ContentHorizontalListView({
    super.key,
    required this.movies,
    required this.type,
  });

  final List<UIMovieModel>? movies;
  final SelectorType type;

  @override
  Widget build(BuildContext context) {
    return movies != null
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SizedBox(
              height: 345, // +40 padding
              width: double.infinity,
              child: ListView.builder(
                itemCount: movies!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (movies != null &&
                      movies!.isNotEmpty &&
                      index == movies!.length - 1) {
                    BlocProvider.of<GuestSessionBloc>(context)
                        .add(LoadNextMoviesPage(
                      loadingListType: type,
                      newPageIndex: (movies!.length ~/ 20) + 1,
                    ));
                  }
                  final movie = movies![index];
                  return _ListViewElement(movie: movie);
                },
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _ListViewElement extends StatelessWidget {
  const _ListViewElement({required this.movie});

  final UIMovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    height: 225,
                    width: 150,
                    child: ImageShower(path: movie.posterPath),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: Icon(
                          Icons.more_horiz,
                          size: 20,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  movie.title,
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                DateFormat('dd MMM yyyy').format(movie.releaseDate),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 105,
            left: 16,
            child: SizedBox(
              height: 34,
              width: 34,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
