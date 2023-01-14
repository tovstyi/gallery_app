import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required String id,
      required String username,
      required String firstName,
      String? lastName,
      String? bio,
      dynamic links,
      dynamic profileImage,
      required int totalCollections,
      required int totalLikes,
      required int totalPhotos,
      required bool acceptedTos,
      required bool forHire,
      dynamic social})
      : super(
            id: id,
            username: username,
            firstName: firstName,
            lastName: lastName,
            bio: bio,
            links: links,
            profileImage: profileImage,
            totalCollections: totalCollections,
            totalLikes: totalLikes,
            totalPhotos: totalPhotos,
            acceptedTos: acceptedTos,
            forHire: forHire,
            social: social);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"] as String,
        username: json["username"] as String,
        firstName: json["first_name"] as String,
        lastName: json["last_name"] as String?,
        bio: json["bio"] as String?,
        links: json["links"] as dynamic,
        profileImage: json["profile_image"] as dynamic,
        totalCollections: json["total_collections"] as int,
        totalPhotos: json["total_photos"] as int,
        totalLikes: json["total_likes"] as int,
        acceptedTos: json["accepted_tos"] as bool,
        forHire: json["for_hire"] as bool,
        social: json["social"] as dynamic);
  }
}
