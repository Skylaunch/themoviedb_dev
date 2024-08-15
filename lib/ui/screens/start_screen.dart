import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb_dev/bloc/guest_session_bloc.dart';
import 'package:themoviedb_dev/helpers/scrollable_movies_sections_helper.dart';
import 'package:themoviedb_dev/ui/widgets/scrollable_movies_section/scrollable_movies_section.dart';
import 'package:themoviedb_dev/ui/widgets/scrollable_trailers_section/scrollable_trailers_section.dart';
import 'package:themoviedb_dev/ui/widgets/welcome_widget/welcome_widget.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GuestSessionBloc>(
      create: (context) => GuestSessionBloc()..add(GuestSessionOpenAppEvent()),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const WelcomeWidget(),
                const ScrollableMoviesSections(type: SelectorType.thrand),
                const ScrollableTrailersSection(),
                const ScrollableMoviesSections(type: SelectorType.popular),
                const ScrollableMoviesSections(type: SelectorType.free),
                // TODO: Кнопка регистрации
                Container(
                  height: 300,
                  color: Colors.red,
                ),
                // TODO: Доска почёта
                Container(
                  height: 300,
                  color: Colors.blue,
                ),
                // TODO: Футер
                Container(
                  height: 300,
                  color: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
