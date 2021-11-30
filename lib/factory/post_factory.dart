import '/model/post/post.dart';
import '/repo/post_repo.dart';

class PostFactory {
  PostRepo postRepo = PostRepo();

  Future<List<Post>> getPost(int id) async {
    return postRepo.getPost(id);
  }
}
