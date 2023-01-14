import 'dart:ui';

import 'package:flutter/material.dart';

import '../../domain/entities/post_entity.dart';

class GalleryPost extends StatefulWidget {
  final PostEntity post;
  final Color? color;

  const GalleryPost({super.key, required this.post, this.color});

  @override
  _GalleryPost createState() => _GalleryPost();
}

class _GalleryPost extends State<GalleryPost> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget postGradient() {
      return Container(
        height: height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.03),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: <Color>[
              Colors.blue.withOpacity(0.05),
              Colors.blueGrey,
            ],
          ),
        ),
      );
    }

    Widget postDetails() {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width > 412 ? width * 0.1 : width * 0.04,
            vertical: width > 412 ? height * 0.04 : height * 0.024),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("@${widget.post.user.username}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: width > 412 ? height * 0.07 : height * 0.03,
                )),
            Text(widget.post.user.firstName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: width > 412 ? height * 0.07 : height * 0.04,
                )),
          ],
        ),
      );
    }

    Widget postImage() {
      return Container(
          height: height * 0.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height * 0.03),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.post.imageUrls["thumb"]!,
                ),
              )));
    }

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'view_photo_page',
          arguments: {'link': widget.post.imageUrls['regular']}),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width > 412 ? width * 0.06 : width * 0.06,
            vertical: width > 412 ? height * 0.01 : height * 0.01),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [postImage(), postGradient(), postDetails()],
        ),
      ),
    );
  }
}
