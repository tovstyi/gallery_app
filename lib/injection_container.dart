import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_app/features/gallery/presentation/bloc/home_page/home_page_cubit.dart';
import 'package:gallery_app/features/gallery/presentation/bloc/view_photo/view_photo_cubit.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// BLoCs
  sl.registerFactory<HomePageCubit>(() => HomePageCubit());
  sl.registerFactory<ViewPhotoCubit>(() => ViewPhotoCubit());

  /// Use-cases
  // sl.registerFactory<LoginUseCase>(() => LoginUseCase(sl()));

  /// Repository
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
  //     remoteDatasource: sl(), networkInfo: sl(), localDatasource: sl()));

  /// Data sources
  // sl.registerLazySingleton<RemoteAuthDatasource>(() => RemoteDatasourceImpl(
  //     localDatasourceMyLease: sl(),
  //     localAuthDatasource: sl(),
  //     localCollaborativesDatasource: sl()));
  // sl.registerLazySingleton<LocalAuthDatasource>(() => LocalDatasourceImpl());
  // sl.registerLazySingleton<RemoteDatasourceMyLease>(
  //         () => RemoteDatasourceMyLeaseImpl(localDatasource: sl()));

  //         () => RemoteChatDatasourceImpl(localAuthDatasource: sl(), localChatDatasource: sl()));
  // sl.registerLazySingleton<LocalCollaborativesDatasource>(
  //         () => LocalCollaborativesDatasourceImpl());
  // sl.registerLazySingleton<LocalDataSourceMyPoints>(
  //         () => LocalDataSourceMyPointsImpl());
  // sl.registerLazySingleton<LocalChatDatasource>(() => LocalChatDatasourceImpl());
  // sl.registerLazySingleton<LocalIncidentDatasource>(() => LocalIncidentDatasourceImpl());
  // sl.registerLazySingleton<RemoteIncidentDatasource>(() => RemoteIncidentDatasourceImpl(sl()));

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
  // sl.registerLazySingleton<FirebaseMessagingService>(
  //         () => FirebaseMessagingService(localDatasource: sl()));
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  sl.registerLazySingleton<GlobalKey<NavigatorState>>(() => navigatorKey);
}
