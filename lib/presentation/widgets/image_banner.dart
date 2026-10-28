import 'package:flutter/material.dart';
import 'package:test_app/presentation/widgets/loading_container.dart';
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
    return ClipRRect(
      borderRadius: .circular(20),
      child: Image.network(
        ApiService.imgBaseUrl + backdropPath,
        width: width,
        height: height,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return LoadingContainer();
        },
        errorBuilder: (context, error, stackTrace) {
          return ImageErrorContainer(height: 200);
        },
      ),
    );
  }
}
