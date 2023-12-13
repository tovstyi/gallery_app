import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/feature_gallery/presentation/bloc/home_page/home_page_cubit.dart';
import '../content_wrap.dart';
import '../injection_container.dart';

class StartPageRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => BlocProvider<HomePageCubit>(
        create: (_) => sl<HomePageCubit>(), child: const ContentWrap()),
  };
}
