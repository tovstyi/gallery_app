import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/errors.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/gallery_repository.dart';
import '../datasources/local_gallery_datasource.dart';
import '../datasources/remote_gallery_datasource.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryRemoteDataSource remoteDataSource;
  final GalleryLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GalleryRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<PostEntity>>> loadGalleryPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.loadGalleryPosts();
        localDataSource.cacheGalleryPosts(response);
        return Right(response);
      } catch (e) {
        if (e is SocketException) {
          return Left(SocketFailure());
        } else if (e is ServerException) {
          if (e.statusCode == 401) {
            return Left(UnauthorizedFailure());
          } else {
            return Left(
                ServerFailure(message: e.message, statusCode: e.statusCode));
          }
        } else {
          return Left(SocketFailure());
        }
      }
    } else {
      try {
        final response = await localDataSource.loadLastGalleryPosts();
        return Right(response);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
