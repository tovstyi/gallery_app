import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/route.dart' as router;

import 'features/gallery/presentation/bloc/home_page/home_page_cubit.dart';
import 'features/gallery/presentation/screens/home_page.dart';
import 'injection_container.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const GalleryApp());
}

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: router.Route.routes,
      home: const ContentWrap(),
    );
  }
}

class ContentWrap extends StatefulWidget {
  const ContentWrap({Key? key}) : super(key: key);

  @override
  _ContentWrapState createState() => _ContentWrapState();
}

class _ContentWrapState extends State<ContentWrap> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => sl<HomePageCubit>(),
      child: const Scaffold(resizeToAvoidBottomInset: false, body: HomePage()),
    );
  }
}
