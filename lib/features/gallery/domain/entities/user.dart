import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String username;
  final String firstName;
  final String? lastName;
  final String? bio;
  final Map<String, String>? links;
  final Map<String, String>? profileImage;
  final int totalCollections;
  final int totalLikes;
  final int totalPhotos;
  final bool acceptedTos;
  final bool forHire;
  final Map<String, String>? social;

  const UserEntity(
      {required this.id,
      required this.username,
      required this.firstName,
      this.lastName,
      this.bio,
      this.links,
      this.profileImage,
      required this.totalCollections,
      required this.totalLikes,
      required this.totalPhotos,
      required this.acceptedTos,
      required this.forHire,
      this.social});

  @override
  List<Object?> get props => [
        id,
        username,
        firstName,
        lastName,
        bio,
        links,
        profileImage,
        totalCollections,
        totalLikes,
        totalPhotos,
        acceptedTos,
        forHire,
        social
      ];
}
