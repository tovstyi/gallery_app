import 'package:flutter/material.dart';

import '../features/feature_gallery/presentation/screens/home_page.dart';
import '../features/feature_gallery/presentation/widgets/custom_app_bar_title.dart';

class ContentWrap extends StatefulWidget {
  const ContentWrap({super.key});

  @override
  State<ContentWrap> createState() => _ContentWrapState();
}

class _ContentWrapState extends State<ContentWrap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const StyledAppBarTitle(
              text: 'Gallery',
            ),
            backgroundColor: Colors.white,
            actions: const []),
        resizeToAvoidBottomInset: false,
        body: const HomePage());
  }
}
