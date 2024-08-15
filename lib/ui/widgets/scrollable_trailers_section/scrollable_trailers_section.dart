import 'package:flutter/material.dart';
import 'package:themoviedb_dev/helpers/app_texts.dart';
import 'package:themoviedb_dev/ui/widgets/scrollable_movies_section/dropdown_selection_options.dart';

class ScrollableTrailersSection extends StatelessWidget {
  const ScrollableTrailersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: Удалить
      height: 300,
      color: Colors.grey,
      child: const Column(
        children: [
          Row(
            children: [
              Text(AppTexts.lastTrailersTitle),
              DropdownSelectionOptions(
                options: ['plug', 'plug', 'plug'],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
