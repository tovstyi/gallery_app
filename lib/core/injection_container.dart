// import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../features/feature_gallery/data/datasources/remote_gallery_datasource.dart';
import '../features/feature_gallery/data/repositories/gallery_repository.dart';
import '../features/feature_gallery/data/repositories/gallery_repository_impl.dart';
import '../features/feature_gallery/domain/usecases/load_gallery_posts_usecase.dart';
import '../features/feature_gallery/presentation/bloc/home_page/home_page_cubit.dart';
import '../features/feature_gallery/presentation/bloc/view_photo/view_photo_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// BLoCs
  sl.registerFactory<HomePageCubit>(
      () => HomePageCubit(loadGalleryPostsUseCase: sl()));
  sl.registerFactory<ViewPhotoCubit>(() => ViewPhotoCubit());

  /// Use-cases
  sl.registerFactory<LoadGalleryPostsUseCase>(
      () => LoadGalleryPostsUseCase(sl()));

  /// Repositories
  sl.registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(remoteDataSource: sl()));

  /// Data sources
  sl.registerLazySingleton<GalleryRemoteDataSource>(
      () => GalleryRemoteDataSourceImpl());

  /// Core
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  sl.registerLazySingleton<GlobalKey<NavigatorState>>(() => navigatorKey);
}
