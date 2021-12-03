import '/model/post.dart';
import '/repo/post_repo.dart';

class PostFactory {
  PostRepo postRepo = PostRepo();

  Future<List<Post>> getPosts(int userId) async {
    return postRepo.getPosts(userId);
  }
}
