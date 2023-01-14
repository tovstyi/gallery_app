import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../entities/post_entity.dart';

abstract class GalleryRepository {
  Future<Either<Failure, List<PostEntity>>> loadGalleryPosts();
}
