import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/exceptions/errors.dart';
import '../models/post_model.dart';
import 'local_gallery_datasource.dart';

abstract class GalleryRemoteDataSource {
  /// Calls the https://api.unsplash.com/photos endpoint
  ///
  /// Throws a [ServerException], [SocketException] for all error codes
  Future<List<PostModel>> loadGalleryPosts();
}

class GalleryRemoteDataSourceImpl implements GalleryRemoteDataSource {
  final GalleryLocalDataSource localDataSource;

  GalleryRemoteDataSourceImpl({required this.localDataSource});

  Dio init() {
    Dio dio = Dio();
    return dio;
  }

  @override
  Future<List<PostModel>> loadGalleryPosts() async {
    final dio = init();
    try {
      final response = await dio.get(galleryAPI);
      return (response.data as List<dynamic>).map((i) {
        return PostModel.fromJson(i);
      }).toList();
    } on DioError catch (e) {
      if (DioErrorType.receiveTimeout == e.type ||
          DioErrorType.connectTimeout == e.type) {
        throw SocketException();
      } else if (e.message.contains('SocketException')) {
        throw SocketException();
      } else {
        if (e.response?.statusCode == 401 &&
            e.response?.data != 'Unauthorized!') {
          throw ServerException(message: e.response!.data, statusCode: 401);
        } else if (e.response?.data == 'Unauthorized!') {
          throw ServerException(message: e.response!.data, statusCode: 403);
        } else {
          throw ServerException(message: 'Unknown error', statusCode: 404);
        }
      }
    }
  }
}
