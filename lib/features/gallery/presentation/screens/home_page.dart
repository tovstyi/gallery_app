import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/post_entity.dart';
import '../bloc/home_page/home_page_cubit.dart';
import '../widgets/gallery_post.dart';
import '../widgets/post_loading_failure.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (_, state) {
        if (state is GalleryPostsLoaded) {
          galleryPosts = state.galleryPosts;
        }
      },
      builder: (context, state) {
        return BlocBuilder<HomePageCubit, HomePageState>(
          buildWhen: (oldState, newState) =>
              newState is HomePageInitial ||
              newState is GalleryPostsLoaded ||
              newState is HomePageServerFailure,
          builder: (context, state) {
            return Stack(
              children: [
                Visibility(
                  // visible: state is! HomePageServerFailure,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: width > 412 ? height * 0.01 : height * 0.015),
                    child: ListView.builder(
                        physics: state is! GalleryPostsLoaded
                            ? const NeverScrollableScrollPhysics()
                            : const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: state is GalleryPostsLoaded
                            ? state.galleryPosts.length
                            : 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GalleryPost(
                              post: galleryPosts[index],
                              color: Colors.amberAccent);
                        }),
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
                Visibility(
                    visible: state is LoadingGalleryPosts,
                    child: const Center(child: CircularProgressIndicator()))
              ],
            );
          },
        );
      },
    );
  }
}
