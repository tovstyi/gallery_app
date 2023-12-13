import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'content_wrap.dart';
import 'core/routes/route.dart' as router;
import 'injection_container.dart' as inj;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
      home: const ContentWrap(),
    );
  }
}
