import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/load_gallery_posts_usecase.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final LoadGalleryPostsUseCase loadGalleryPostsUseCase;

  HomePageCubit({required this.loadGalleryPostsUseCase})
      : super(HomePageInitial());

  loadGalleryPosts() async {
    emit(LoadingGalleryPosts());
    final response = await loadGalleryPostsUseCase();
    return response.fold((failure) {
      if (failure is ServerFailure) {
        return emit(LoadingGalleryPostsFailed());
      }
    }, (response) => emit(GalleryPostsLoaded(galleryPosts: response)));
  }
}
