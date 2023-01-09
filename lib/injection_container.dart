import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';
import 'features/gallery/data/datasources/remote_gallery_datasource.dart';
import 'features/gallery/data/repositories/gallery_repository_impl.dart';
import 'features/gallery/domain/usecases/load_gallery_posts_usecase.dart';
import 'features/gallery/presentation/bloc/home_page/home_page_cubit.dart';
import 'features/gallery/presentation/bloc/view_photo/view_photo_cubit.dart';

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
  sl.registerLazySingleton<GalleryRepositoryImpl>(() => GalleryRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  /// Data sources
  sl.registerLazySingleton<GalleryRemoteDataSourceImpl>(
      () => GalleryRemoteDataSourceImpl(localDataSource: sl()));

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
  // sl.registerLazySingleton<FirebaseMessagingService>(
  //         () => FirebaseMessagingService(localDatasource: sl()));
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  sl.registerLazySingleton<GlobalKey<NavigatorState>>(() => navigatorKey);
}
