import 'package:flutter/material.dart';

import 'loading_failure.dart';

class RectImage extends StatelessWidget {
  final String? imageLink;
  final Size size;

  /// value from 0.0 to 1.0
  final double imageHeight;

  const RectImage(
      {super.key,
      this.imageLink,
      required this.size,
      required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.height * 0.03),
      child: imageLink != null && imageLink!.isNotEmpty
          ? Image.network(
              imageLink!,
              fit: BoxFit.cover,
              height: size.height * imageHeight,
              width: size.width,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            )
          : const LoadingFailure(
              errorText: 'Bad photo link ...',
              swipeToReload: false,
            ),
    );
  }
}
