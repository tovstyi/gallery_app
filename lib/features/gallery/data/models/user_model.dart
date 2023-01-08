import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required String id,
      required String username,
      required String firstName,
      String? lastName,
      String? bio,
      Map<String, String>? links,
      Map<String, String>? profileImage,
      required int totalCollections,
      required int totalLikes,
      required int totalPhotos,
      required bool acceptedTos,
      required bool forHire,
      Map<String, String>? social})
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
            forHire: forHire);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"] as String,
        username: json["username"] as String,
        firstName: json["first_name"] as String,
        lastName: json["last_name"] ?? String,
        bio: json["bio"] ?? String,
        links: json["links"] ?? Map<String, String>,
        profileImage: json["profile_image"] ?? Map<String, String>,
        totalCollections: json["total_collections"] as int,
        totalPhotos: json["total_photos"] as int,
        totalLikes: json["total_likes"] as int,
        acceptedTos: json["accepted_tos"] as bool,
        forHire: json["for_hire"] as bool);
  }
}
