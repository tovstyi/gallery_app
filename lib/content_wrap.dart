import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/feature_gallery/presentation/bloc/home_page/home_page_cubit.dart';
import 'features/feature_gallery/presentation/screens/home_page.dart';
import 'features/feature_gallery/presentation/widgets/custom_app_bar.dart';
import 'features/feature_gallery/presentation/widgets/custom_app_bar_title.dart';
import 'injection_container.dart';

class ContentWrap extends StatefulWidget {
  const ContentWrap({super.key});

  @override
  State<ContentWrap> createState() => _ContentWrapState();
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
