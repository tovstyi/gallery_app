import 'package:flutter/material.dart';

class CustomAppBarTitle extends StatelessWidget {
  final String text;

  const CustomAppBarTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Text(
      text,
      style: TextStyle(
          color: Colors.black,
          fontSize: width > 412 ? height * 0.07 : height * 0.035),
    );
  }
}
