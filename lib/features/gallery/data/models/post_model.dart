import '../../domain/entities/post_entity.dart';
import '../../domain/entities/user.dart';
import 'user_model.dart';

class PostModel extends PostEntity {
  const PostModel({
    required String id,
    required int width,
    required int height,
    required String color,
    required String blurHash,
    String? description,
    String? altDescription,
    required dynamic imageUrls,
    required bool likedByUser,
    required UserEntity user,
  }) : super(
            id: id,
            width: width,
            height: height,
            color: color,
            blurHash: blurHash,
            description: description,
            altDescription: altDescription,
            imageUrls: imageUrls,
            likedByUser: likedByUser,
            user: user);

  factory PostModel.fromJson(Map<String, dynamic> jsonResponse) {
    return PostModel(
        id: jsonResponse["id"] as String,
        width: jsonResponse["width"] as int,
        height: jsonResponse["height"] as int,
        color: jsonResponse["color"] as String,
        blurHash: jsonResponse["blur_hash"] as String,
        description: jsonResponse["description"] as String?,
        altDescription: jsonResponse["alt_description"] as String?,
        imageUrls: jsonResponse["urls"] as dynamic,
        likedByUser: jsonResponse["liked_by_user"] as bool,
        user: UserModel.fromJson(jsonResponse["user"]));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'color': color,
      'blur_hash': blurHash,
      'description': description,
      'alt_description': altDescription,
      'urls': imageUrls,
      'liked_by_user': likedByUser,
      'user': user.toJson()
    };
  }
}
