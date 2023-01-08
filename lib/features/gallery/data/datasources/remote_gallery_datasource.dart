import '../../../../core/exceptions/errors.dart';
import '../models/gallery_model.dart';

abstract class RemoteGalleryDataSource {
  /// Calls the https://api.unsplash.com/photos/ endpoint
  ///
  /// Throws a [ServerException], [SocketException] for all error codes
  Future<GalleryModel> loadGalleryPosts();
}

// class RemoteGalleryDataSourceImpl implements RemoteGalleryDataSource {
//   @override
//   Future<GalleryModel> loadGalleryPosts() {}
// }
