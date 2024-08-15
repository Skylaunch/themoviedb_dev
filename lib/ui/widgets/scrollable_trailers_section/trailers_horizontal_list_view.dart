import 'package:flutter/material.dart';
import 'package:themoviedb_dev/ui/ui_models/ui_movie_model.dart';

class TrailersHorizontalListView extends StatelessWidget {
  const TrailersHorizontalListView({
    super.key,
    required this.trailers,
  });

  final List<UIMovieModel>? trailers;

  @override
  Widget build(BuildContext context) {
    return trailers != null
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SizedBox(
              height: 345,
              width: double.infinity,
              child: ListView.builder(
                itemCount: trailers!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final trailer = trailers![index];
                  return _TrailerView(trailer: trailer);
                },
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _TrailerView extends StatelessWidget {
  const _TrailerView({required this.trailer});

  final UIMovieModel trailer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 213,
      width: 300,
      color: Colors.green,
    );
  }
}
