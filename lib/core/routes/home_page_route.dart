import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/feature_gallery/presentation/bloc/home_page/home_page_cubit.dart';
import '../../features/feature_gallery/presentation/screens/home_page.dart';
import '../../injection_container.dart';

class HomePageRoute {
  static Map<String, Widget Function(BuildContext)> routes = {
    'home_page': (context) => BlocProvider<HomePageCubit>(
        create: (_) => sl<HomePageCubit>(),
        child: const Scaffold(body: HomePage())),
  };
}
