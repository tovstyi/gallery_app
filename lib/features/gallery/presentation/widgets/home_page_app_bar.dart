import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final double height;
  final double width;

  HomePageAppBar({
    Key? key,
    required this.height,
    required this.width,
  })  : preferredSize = Size.fromHeight(height * 0.08),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          "Gallery",
          style: TextStyle(
              color: Colors.black,
              fontSize: width > 412 ? height * 0.07 : height * 0.04),
        ),
        backgroundColor: Colors.white,
        actions: const []);
  }
}
