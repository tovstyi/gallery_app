import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failures.dart';
import '../../domain/entities/post_entity.dart';
import '../datasources/remote_gallery_datasource.dart';
import 'gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryRemoteDataSource remoteDataSource;

  GalleryRepositoryImpl({required this.remoteDataSource});

  final Connectivity connectivity = Connectivity();

  isConnectedToNetwork() async {
    return await connectivity.checkConnectivity() != ConnectivityResult.none;
  }

  @override
  Future<Either<Failure, List<PostEntity>>> loadGalleryPosts() async {
    if (await isConnectedToNetwork()) {
      try {
        final response = await remoteDataSource.loadGalleryPosts();
        return Right(response);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message, statusCode: e.statusCode));
      }
    }

    return Left(NetworkConnectionFailure());
  }
}
