import 'dart:ui';

import 'package:flutter/material.dart';

import '../../domain/entities/post_entity.dart';

class GalleryPost extends StatefulWidget {
  final PostEntity post;
  final Size size;

  const GalleryPost({super.key, required this.post, required this.size});

  @override
  _GalleryPost createState() => _GalleryPost();
}

class _GalleryPost extends State<GalleryPost> {
  @override
  Widget build(BuildContext context) {
    Widget postGradient() {
      return Container(
        height: widget.size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.size.height * 0.03),
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
            Text("@${widget.post.user.username}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width > 412
                      ? widget.size.height * 0.07
                      : widget.size.height * 0.03,
                )),
            Text(widget.post.user.firstName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.width > 412
                      ? widget.size.height * 0.07
                      : widget.size.height * 0.04,
                )),
          ],
        ),
      );
    }

    Widget postImage() {
      return Container(
          height: widget.size.height * 0.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.size.height * 0.03),
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
            horizontal: widget.size.width > 412
                ? widget.size.width * 0.06
                : widget.size.width * 0.06,
            vertical: widget.size.width > 412
                ? widget.size.height * 0.01
                : widget.size.height * 0.01),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [postImage(), postGradient(), postDetails()],
        ),
      ),
    );
  }
}
