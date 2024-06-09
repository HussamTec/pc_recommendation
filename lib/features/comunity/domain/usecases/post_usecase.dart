
import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';

class CreatePost {
  final PostRepository repository;

  CreatePost(this.repository);

  Future<void> call(Post post) {
    return repository.createPost(post);
  }
}

class ToggleLikePost {
  final PostRepository repository;

  ToggleLikePost(this.repository);

  Future<void> call(String postId, String userId) {
    return repository.toggleLikePost(postId, userId);
  }
}
class SharePost {
  final PostRepository repository;

  SharePost(this.repository);

  Future<void> call(String postId, String userId) {
    return repository.sharePost(postId, userId);
  }
}

class AddComment {
  final PostRepository repository;

  AddComment(this.repository);

  Future<void> call(Comment comment) {
    return repository.addComment(comment);
  }
}

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Stream<List<Post>> call() {
    return repository.getPosts();
  }
}
