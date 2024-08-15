import 'package:flutter/material.dart';
import 'package:themoviedb_dev/helpers/vote_avarage_percent_painter.dart';

class VoteAveragePercentWidget extends StatelessWidget {
  const VoteAveragePercentWidget({
    super.key,
    required this.percent,
    required this.voteAverageText,
  });

  final double percent;
  final String voteAverageText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      width: 34,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: VoteAvaragePercentPainter(percent: percent),
          ),
          Center(
            child: Text(
              voteAverageText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 8,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
