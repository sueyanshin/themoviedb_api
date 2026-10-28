import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  const new({super.key, this.height = 100});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: .center,
      child: CircularProgressIndicator(),
    );
  }
}

class ImageErrorContainer extends StatelessWidget {
  const new({super.key, this.height = 100});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: .center,
      color: Colors.grey[300],
      child: Icon(Icons.broken_image, size: 40, color: Colors.grey[400]),
    );
  }
}
