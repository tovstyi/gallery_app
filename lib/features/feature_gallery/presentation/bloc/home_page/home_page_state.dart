part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class LoadingGalleryPosts extends HomePageState {}

class LoadingGalleryPostsFailed extends HomePageState {}

class GalleryPostsLoaded extends HomePageState {
  final List<PostEntity> galleryPosts;

  GalleryPostsLoaded({required this.galleryPosts});
}
