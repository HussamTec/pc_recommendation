import '../entities/post_entity.dart';

abstract class PostRepository {
  Future<void> createPost(Post post);
  Future<void> toggleLikePost(String postId, String userId);
  Future<void> sharePost(String postId, String userId);
  Future<void> addComment(Comment comment);
  Stream<List<Post>> getPosts();
}
