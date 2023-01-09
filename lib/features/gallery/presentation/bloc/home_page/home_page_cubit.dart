import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
      if (failure is UnauthorizedFailure) {
        return emit(HomePageUnauthorized());
      } else if (failure is ServerFailure) {
        return emit(HomePageServerFailure());
      } else {
        return emit(LoadingCachedGalleryPostsFailure());
      }
    }, (response) => emit(GalleryPostsLoaded(galleryPosts: response)));
  }
}
