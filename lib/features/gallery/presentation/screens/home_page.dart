import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/post_entity.dart';
import '../bloc/home_page/home_page_cubit.dart';
import '../widgets/gallery_post.dart';
import '../widgets/gallery_post_skeleton.dart';
import '../widgets/post_loading_failure.dart';
import '../widgets/responsive_safe_area.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late List<PostEntity> galleryPosts = [];

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().loadGalleryPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (_, state) {
        if (state is GalleryPostsLoaded) {
          galleryPosts = state.galleryPosts;
        }
      },
      builder: (context, state) {
        return BlocBuilder<HomePageCubit, HomePageState>(
          buildWhen: (oldState, newState) => oldState != newState,
          builder: (context, state) {
            return ResponsiveSafeArea(
              builder: (BuildContext context, Size size) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.width > 412
                              ? size.height * 0.01
                              : size.height * 0.015),
                      child: RefreshIndicator(
                        color: Colors.green,
                        onRefresh: () async =>
                            context.read<HomePageCubit>().loadGalleryPosts(),
                        child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: state is LoadingGalleryPosts
                                ? 6
                                : state is GalleryPostsLoaded
                                    ? state.galleryPosts.length
                                    : 0,
                            itemBuilder: (BuildContext context, int index) =>
                                state is! LoadingGalleryPosts
                                    ? GalleryPost(
                                        post: galleryPosts[index],
                                        size: size,
                                      )
                                    : const GalleryPostSkeleton()),
                      ),
                    ),
                    Visibility(
                        visible: state is HomePageServerFailure,
                        child: const LoadingFailure(
                          errorText: "Failed to load posts from server",
                        )),
                    Visibility(
                        visible: state is LoadingCachedGalleryPostsFailure,
                        child: const LoadingFailure(
                          errorText: "Failed to load posts from cache",
                        )),
                    Visibility(
                        visible: state is HomePageUnauthorized,
                        child: const LoadingFailure(
                          errorText: "Authorise to load posts",
                        )),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
