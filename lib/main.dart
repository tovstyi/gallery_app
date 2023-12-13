import 'package:flutter/material.dart';

import 'core/injection_container.dart' as inj;
import 'core/routes/route.dart' as router;

main() async {
  await inj.init();
  runApp(const GalleryApp());
}

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: router.Route.routes,
    );
  }
}
