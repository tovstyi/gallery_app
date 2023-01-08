import 'package:equatable/equatable.dart';

import 'post_entity.dart';

class GalleryEntity extends Equatable {
  final List<PostEntity> posts;

  const GalleryEntity({required this.posts});

  @override
  List<Object?> get props => [posts];
}
