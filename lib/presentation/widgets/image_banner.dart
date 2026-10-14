import 'package:flutter/material.dart';
import 'package:test_app/services/api_service.dart';

class ImageBanner extends StatelessWidget {
  const new({
    super.key,
    required this.width,
    required this.height,
    required this.backdropPath,
  });

  final String backdropPath;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      ApiService.imgBaseUrl + backdropPath,
      width: width,
      height: height,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 200,
          alignment: .center,
          color: Colors.grey[200],
          child: Icon(Icons.broken_image, size: 40),
        );
      },
    );
  }
}
