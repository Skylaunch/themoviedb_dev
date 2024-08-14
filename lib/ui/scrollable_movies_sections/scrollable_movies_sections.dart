import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb_dev/bloc/guest_session_bloc.dart';
import 'package:themoviedb_dev/ui/scrollable_movies_sections/content_horizontal_list_view.dart';
import 'package:themoviedb_dev/ui/scrollable_movies_sections/dropdown_selection_options.dart';
import 'package:themoviedb_dev/ui/scrollable_movies_sections/scrollable_movies_sections_helpers/scrollable_movies_sections_helper.dart';
import 'package:themoviedb_dev/ui/ui_models/ui_movie_model.dart';

class ScrollableMoviesSections extends StatefulWidget {
  const ScrollableMoviesSections({super.key, required this.type});

  final SelectorType type;

  @override
  State<ScrollableMoviesSections> createState() =>
      _ScrollableMoviesSectionsState();
}

class _ScrollableMoviesSectionsState extends State<ScrollableMoviesSections> {
  List<UIMovieModel>? moviesList;

  @override
  Widget build(BuildContext context) {
    final title = ScrollableMoviesSectionsHelper.getTitleFromType(widget.type);
    final dropdownTitles =
        ScrollableMoviesSectionsHelper.getDropdownTitlesFromType(widget.type);

    switch (widget.type) {
      case SelectorType.thrand:
        moviesList = context.watch<GuestSessionBloc>().state.thrandMovies;
        break;
      case SelectorType.popular:
        moviesList = context.watch<GuestSessionBloc>().state.popularMovies;
        break;
      case SelectorType.free:
        // TODO: Добавить ещё 1 тип
        break;
    }

    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          children: [
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 20),
            DropdownSelectionOptions(
              options: dropdownTitles,
            ),
          ],
        ),
        const SizedBox(height: 20),
        ContentHorizontalListView(
          movies: moviesList,
          type: widget.type,
        ),
      ],
    );
  }
}
