import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../../data/repositories/gallery_repository.dart';
import '../entities/post_entity.dart';

class LoadGalleryPostsUseCase {
  final GalleryRepository repository;

  LoadGalleryPostsUseCase(this.repository);

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await repository.loadGalleryPosts();
  }
}
