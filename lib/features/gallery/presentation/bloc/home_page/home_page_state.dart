part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class LoadingGalleryPosts extends HomePageState {}

class HomePageUnauthorized extends HomePageState {}

class HomePageServerFailure extends HomePageState {}

class LoadingCachedGalleryPostsFailure extends HomePageState {}

class GalleryPostsLoaded extends HomePageState {
  final List<PostEntity> galleryPosts;

  GalleryPostsLoaded({required this.galleryPosts});
}
