import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb_dev/bloc/guest_session_bloc.dart';
import 'package:themoviedb_dev/ui/scrollable_movies_sections/scrollable_movies_sections.dart';
import 'package:themoviedb_dev/ui/scrollable_movies_sections/scrollable_movies_sections_helpers/scrollable_movies_sections_helper.dart';

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
                const ScrollableMoviesSections(type: SelectorType.thrand),
                Container(
                  height: 300,
                  color: Colors.red,
                ),
                const ScrollableMoviesSections(type: SelectorType.popular),
                Container(
                  height: 300,
                  color: Colors.blue,
                ),
                const ScrollableMoviesSections(type: SelectorType.free),
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
