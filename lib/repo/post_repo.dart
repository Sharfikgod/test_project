import 'package:dio/dio.dart';
import '/helper/something_wrong_exception.dart';
import '/model/post/post.dart';
import '/model/post/post_dto.dart';

class PostRepo {
  Future<List<Post>> getPost(int id) async {
    try {
      var response = await Dio().get("http://jsonplaceholder.typicode.com/users/$id/posts");
      var imageUrlPost = 'https://static.uvidpustku.com/wp-content/uploads/2019/01/beach-1630540_1920.jpg';
      var imageUrlProfile = 'https://pfpmaker.com/_nuxt/img/profile-3-1.3e702c5.png';

      return response.data!
          .map<Post>(
            (snapshot) => PostDTO.fromJson(snapshot).toPost(imageUrlPost, imageUrlProfile),
          )
          .toList();
    } catch (e) {
      throw SomethingWrongException();
    }
  }
}
