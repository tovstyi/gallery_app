import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.id,
      required super.username,
      required super.firstName,
      super.lastName,
      super.bio,
      super.links,
      super.profileImage,
      required super.totalCollections,
      required super.totalLikes,
      required super.totalPhotos,
      required super.acceptedTos,
      required super.forHire,
      super.social});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] as String,
        username: json['username'] as String,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String?,
        bio: json['bio'] as String?,
        links: json['links'] as dynamic,
        profileImage: json['profile_image'] as dynamic,
        totalCollections: json['total_collections'] as int,
        totalPhotos: json['total_photos'] as int,
        totalLikes: json['total_likes'] as int,
        acceptedTos: json['accepted_tos'] as bool,
        forHire: json['for_hire'] as bool,
        social: json['social'] as dynamic);
  }
}
