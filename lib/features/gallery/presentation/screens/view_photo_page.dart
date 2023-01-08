import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewPhotoPage extends StatefulWidget {
  const ViewPhotoPage({super.key});

  @override
  _ViewPhotoPage createState() => _ViewPhotoPage();
}

class _ViewPhotoPage extends State<ViewPhotoPage> {
  late String link;

  @override
  void initState() {
    super.initState();
    // TODO: transfer photo link through the cubit
    // context.read<ViewPhotoCubit>.getLink();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: const [
          // TODO: show one photo with max. size from given link
        ],
      ),
    );
  }
}
