import 'package:dio/dio.dart';

import '../../../../core/constants/api.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../models/post_model.dart';

abstract class GalleryRemoteDataSource {
  /// Calls the https://api.unsplash.com/photos/?client_id= endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<PostModel>> loadGalleryPosts();
}

class GalleryRemoteDataSourceImpl implements GalleryRemoteDataSource {
  final Dio dio = Dio(
    BaseOptions(
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
    ),
  );

  @override
  Future<List<PostModel>> loadGalleryPosts() async {
    try {
      final response = await dio.get(galleryAPI);
      return (response.data as List<dynamic>).map((i) {
        return PostModel.fromJson(i);
      }).toList();
    } on DioException catch (e) {
      throw ServerException(
          message: e.response!.statusMessage!,
          statusCode: e.response!.statusCode!);
    }
  }
}
