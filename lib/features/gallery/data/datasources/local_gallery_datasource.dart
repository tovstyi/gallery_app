import '../../../../core/exceptions/errors.dart';
import '../models/gallery_model.dart';

abstract class LocalGalleryDataSource {
  /// Gets the cached [GalleryModel] which was gotten the last time the https://api.unsplash.com/photos/ endpoint
  /// the user had an internet connection
  ///
  /// Throws a [CacheException] if no cached data is present
  Future<GalleryModel> loadLastGalleryPosts();

  Future<void> cacheGalleryPosts(GalleryModel galleryToCache);
}
