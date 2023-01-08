import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../entities/gallery_entity.dart';

abstract class GalleryRepository {
  Future<Either<Failure, GalleryEntity>> loadGalleryPosts();
}
