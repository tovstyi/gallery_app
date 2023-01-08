import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../../domain/entities/gallery_entity.dart';
import '../../domain/repositories/gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  @override
  Future<Either<Failure, GalleryEntity>> loadGalleryPosts() {
    // TODO: implement loadGalleryPosts
    throw UnimplementedError();
  }
}
