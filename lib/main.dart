import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/session_bloc.dart';
import 'core/route.dart' as router;
import 'features/gallery/presentation/bloc/home_page/home_page_cubit.dart';
import 'features/gallery/presentation/screens/home_page.dart';
import 'features/gallery/presentation/widgets/custom_app_bar.dart';
import 'features/gallery/presentation/widgets/custom_app_bar_title.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await di.init();
  runApp(const GalleryApp());
}

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SessionBloc>(
        create: (context) => sl<SessionBloc>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gallery App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: router.Route.routes,
          home: const ContentWrap(),
        ));
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
      child: Scaffold(
          appBar: CustomAppBar(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            title: const CustomAppBarTitle(
              text: 'Gallery',
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: const HomePage()),
    );
  }
}
