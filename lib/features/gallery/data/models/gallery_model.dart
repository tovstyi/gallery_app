import '../../domain/entities/gallery_entity.dart';
import '../../domain/entities/post_entity.dart';
import 'post_model.dart';

class GalleryModel extends GalleryEntity {
  const GalleryModel({required List<PostEntity> posts}) : super(posts: posts);

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
        posts: json.values.map((e) => PostModel.fromJson(e)).toList());
  }
}
