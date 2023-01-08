import 'package:equatable/equatable.dart';

import 'user.dart';

class PostEntity extends Equatable {
  final String id;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final String? description;
  final String? altDescription;
  final Map<String, String> imageUrls;
  final bool likedByUser;
  final UserEntity user;

  const PostEntity({
    required this.id,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    this.altDescription,
    required this.imageUrls,
    required this.likedByUser,
    required this.user,
  });

  @override
  List<Object?> get props => [
        id,
        width,
        height,
        color,
        blurHash,
        description,
        altDescription,
        imageUrls,
        likedByUser,
        user
      ];
}
