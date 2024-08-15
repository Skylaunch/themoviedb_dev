import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ImageShower extends StatelessWidget {
  const ImageShower({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      width: 150,
      child: FancyShimmerImage(
        imageUrl: path,
        shimmerBaseColor: const Color(0xFFEBEBF4),
        shimmerHighlightColor: const Color(0xFFF4F4F4),
        shimmerBackColor: const Color(0xFFEBEBF4),
        errorWidget: Container(
          height: 225,
          width: 150,
          color: Colors.red,
        ),
      ),
    );
  }
}
