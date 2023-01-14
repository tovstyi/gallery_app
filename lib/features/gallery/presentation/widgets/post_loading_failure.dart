import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingFailure extends StatelessWidget {
  final String errorText;

  const LoadingFailure({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width > 412 ? width * 0.09 : width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: width > 412 ? width * 0.09 : width * 0.1),
            child: Text(
              "$errorText. Swipe to refresh the page.",
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: width > 412 ? height * 0.03 : height * 0.03),
            ),
          ),
          Image(
            height: height * 0.2,
            image: const AssetImage("assets/images/homePageImages/error.png"),
          ),
        ],
      ),
    );
  }
}
