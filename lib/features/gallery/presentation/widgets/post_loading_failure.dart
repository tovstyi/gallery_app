import 'package:flutter/cupertino.dart';

class LoadingFailure extends StatelessWidget {
  final String errorText;

  const LoadingFailure({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: width > 412 ? height * 0.03 : height * 0.03),
            child: Text(
              errorText,
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
