import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/post_repository.dart';
import '../data_source/remote/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createPost(Post post) {
    return remoteDataSource.createPost(post);
  }

  @override
  Future<void> toggleLikePost(String postId, String userId) {
    return remoteDataSource.toggleLikePost(postId, userId);
  }

  @override
  Future<void> sharePost(String postId, String userId) {
    return remoteDataSource.sharePost(postId, userId);
  }

  @override
  Future<void> addComment(Comment comment) {
    return remoteDataSource.addComment(comment);
  }

  @override
  Stream<List<Post>> getPosts() {
    return remoteDataSource.getPosts();
  }
}
