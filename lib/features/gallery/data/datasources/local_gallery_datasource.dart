import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/exceptions/errors.dart';
import '../models/post_model.dart';

abstract class GalleryLocalDataSource {
  /// Gets the cached [GalleryModel] which was gotten the last time the https://api.unsplash.com/photos/ endpoint
  /// the user had an internet connection
  ///
  /// Throws a [CacheException] if no cached data is present
  Future<List<PostModel>> loadLastGalleryPosts();

  Future<void> cacheGalleryPosts(List<PostModel> galleryToCache);
}

const cachedGalleryKey = "CACHED_GALLERY_KEY";

class GalleryLocalDataSourceImpl implements GalleryLocalDataSource {
  @override
  Future<void> cacheGalleryPosts(List<PostModel> gallery) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        cachedGalleryKey, json.encode(gallery.map((e) => e.toJson()).toList()));
  }

  @override
  Future<List<PostModel>> loadLastGalleryPosts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(cachedGalleryKey);

    if (jsonString != null) {
      return Future.value(
          json.decode(jsonString).map((i) => PostModel.fromJson(i)).toList());
    } else {
      throw CacheException();
    }
  }
}
