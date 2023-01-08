import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../entities/gallery_entity.dart';
import '../repositories/gallery_repository.dart';

class LoadGalleryPostsUseCase {
  final GalleryRepository repository;

  LoadGalleryPostsUseCase(this.repository);

  Future<Either<Failure, GalleryEntity>> call() async {
    return await repository.loadGalleryPosts();
  }
}
