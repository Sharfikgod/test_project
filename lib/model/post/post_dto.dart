import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/model/post/post.dart';

part 'post_dto.g.dart';

@JsonSerializable()
class PostDTO {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostDTO({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDTO.fromJson(Map<String, dynamic> json) => _$PostDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PostDTOToJson(this);

  factory PostDTO.fromUser(Post post) => PostDTO(
        userId: post.userId,
        id: post.id,
        title: post.title,
        body: post.body,
      );

  Post toPost(imageUrlPost, imageUrlProfile) => Post(
        userId: userId,
        id: id,
        title: title,
        body: body,
        imageUrlPost: imageUrlPost,
        imageUrlProfile: imageUrlProfile,
      );
}
