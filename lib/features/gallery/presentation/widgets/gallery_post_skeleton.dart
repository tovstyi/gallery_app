import 'package:flutter/cupertino.dart';
import 'package:skeletons/skeletons.dart';

class GalleryPostSkeleton extends StatelessWidget {
  const GalleryPostSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SkeletonAvatar(
      style: SkeletonAvatarStyle(
          padding: EdgeInsets.symmetric(
              horizontal: width > 412 ? width * 0.1 : width * 0.04,
              vertical: width > 412 ? height * 0.014 : height * 0.01),
          height: height * 0.3,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(height * 0.03)),
    );
  }
}
