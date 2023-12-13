import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'responsive_safe_area.dart';

class LoadingFailure extends StatelessWidget {
  final String errorText;
  final bool swipeToReload;

  const LoadingFailure(
      {super.key, required this.errorText, this.swipeToReload = true});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(builder: (context, size) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                size.width > 412 ? size.width * 0.09 : size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical:
                      size.width > 412 ? size.width * 0.09 : size.width * 0.1),
              child: Text(
                errorText +
                    (swipeToReload ? '. Swipe to refresh the page.' : ''),
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size.width > 412
                        ? size.height * 0.03
                        : size.height * 0.03),
              ),
            ),
            Image(
              height: size.height * 0.2,
              width: size.width,
              image: const AssetImage('assets/images/homePageImages/error.png'),
            ),
          ],
        ),
      );
    });
  }
}
