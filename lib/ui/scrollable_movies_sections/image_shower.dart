import 'package:flutter/material.dart';

class ImageShower extends StatelessWidget {
  const ImageShower({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      width: 150,
      child: Image.network(path),
    );
  }
}
