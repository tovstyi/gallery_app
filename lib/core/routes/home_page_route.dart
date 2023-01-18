import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/gallery/presentation/bloc/home_page/home_page_cubit.dart';

import '../../features/gallery/presentation/screens/home_page.dart';
import '../../injection_container.dart';
import '../bloc/session_bloc.dart';

class HomePageRoute {
  static Map<String, Widget Function(BuildContext)> routes = {
    'home_page': (context) => BlocProvider.value(
        value: sl<SessionBloc>(),
        child: BlocProvider<HomePageCubit>(
            create: (_) => sl<HomePageCubit>(),
            child: const Scaffold(body: HomePage()))),
  };
}
