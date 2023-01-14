import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final double height;
  final double width;
  final Widget? leading;
  final Widget? title;

  CustomAppBar({
    Key? key,
    required this.height,
    required this.width,
    this.leading,
    this.title,
  })  : preferredSize = Size.fromHeight(height * 0.08),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: leading,
        title: title,
        backgroundColor: Colors.white,
        actions: const []);
  }
}
