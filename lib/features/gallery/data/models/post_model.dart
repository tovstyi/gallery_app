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
    required Map<String, String> imageUrls,
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

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json["id"] as String,
        width: json["width"] as int,
        height: json["height"] as int,
        color: json["color"] as String,
        blurHash: json["blur_hash"] as String,
        description: json["description"] ?? String,
        altDescription: json["alt_description"] ?? String,
        imageUrls: json["urls"] as Map<String, String>,
        likedByUser: json["liked_by_user"] as bool,
        user: UserModel.fromJson(json["user"]));
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
