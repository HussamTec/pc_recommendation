import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/entities/post_entity.dart';
import '../../models/post_model.dart';


abstract class PostRemoteDataSource {
  Future<void> createPost(Post post);
  Future<void> toggleLikePost(String postId, String userId);
  Future<void> sharePost(String postId, String userId);
  Future<void> addComment(Comment comment);
  Stream<List<Post>> getPosts();

}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final FirebaseFirestore firestore;


  PostRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> createPost(Post post) {
    final postModel = PostModel(id: '', content: post.content, likedBy: [],creator: post.creator, postTime: DateTime.now());
    return firestore.collection('posts').add(postModel.toMap());
  }

  @override
  Future<void> toggleLikePost(String postId, String userId) async {
    final postRef = firestore.collection('posts').doc(postId);
    final postSnapshot = await postRef.get();

    if (postSnapshot.exists) {
      final postData = postSnapshot.data();
      final List<String> likedBy = List<String>.from(postData?['likedBy'] ?? []);
      int likes = postData?['likes'] ?? 0;

      if (likedBy.contains(userId)) {
        likedBy.remove(userId);
        likes--;
      } else {
        likedBy.add(userId);
        likes++;
      }

      final updatedData = {
        'likes': likes,
        'likedBy': likedBy,
      };

      await postRef.update(updatedData);
    }
  }

  @override
  Future<void> sharePost(String postId, String userId) {
    return firestore.collection('posts').doc(postId).update({
      'sharedBy': FieldValue.arrayUnion([userId])
    });
  }

  @override
  Future<void> addComment(Comment comment) {
    final commentModel = CommentModel.fromEntity(comment);
    return firestore.collection('posts').doc(comment.postId).update({
      'comments': FieldValue.arrayUnion([commentModel.toMap()])
    });
  }

  @override
  Stream<List<Post>> getPosts() {
    return firestore.collection('posts').orderBy('postTime', descending: true).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => PostModel.fromMap(doc.data(), doc.id)).toList());
  }


}
