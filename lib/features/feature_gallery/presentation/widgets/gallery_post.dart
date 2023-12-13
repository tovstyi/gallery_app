import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/post_entity.dart';
import '../bloc/view_photo/view_photo_cubit.dart';
import '../screens/view_photo_page.dart';
import 'rect_image.dart';

class GalleryPost extends StatefulWidget {
  final PostEntity post;
  final Size size;

  const GalleryPost({super.key, required this.post, required this.size});

  @override
  State<GalleryPost> createState() => _GalleryPost();
}

class _GalleryPost extends State<GalleryPost> {
  @override
  Widget build(BuildContext context) {
    Widget postGradient() {
      return Container(
        height: widget.size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.size.height * 0.03),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.black12,
              Colors.blueGrey,
            ],
          ),
        ),
      );
    }

    Widget postDetails() {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.size.width > 412
                ? widget.size.width * 0.1
                : widget.size.width * 0.04,
            vertical: widget.size.width > 412
                ? widget.size.height * 0.04
                : widget.size.height * 0.024),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.post.user.firstName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width > 412
                      ? widget.size.height * 0.07
                      : widget.size.height * 0.04,
                )),
            Text('@${widget.post.user.username}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width > 412
                      ? widget.size.height * 0.07
                      : widget.size.height * 0.03,
                )),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => Navigator.of(context).push(PageTransition(
        child: BlocProvider<ViewPhotoCubit>(
            create: (_) => sl<ViewPhotoCubit>(),
            child: ViewPhotoPage(
              link: widget.post.imageUrls['regular'],
            )),
        type: PageTransitionType.fade,
        alignment: Alignment.center,
      )),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.size.width > 412
                ? widget.size.width * 0.06
                : widget.size.width * 0.06,
            vertical: widget.size.width > 412
                ? widget.size.height * 0.01
                : widget.size.height * 0.01),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            RectImage(
              size: widget.size,
              imageLink: widget.post.imageUrls['thumb'],
              imageHeight: 0.3,
            ),
            postGradient(),
            postDetails()
          ],
        ),
      ),
    );
  }
}
