import '../../domain/entities/post_entity.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.content,
    required super.postTime,
    required super.creator,
    super.likes,
    super.sharedBy,
    super.comments,
    required super.likedBy,
  });

  factory PostModel.fromMap(Map<String, dynamic> map, String id) {
    return PostModel(
      id: id,
      content: map['content'],
      postTime: map['postTime'].toDate(),
      creator: map['creator'],
      likedBy: map['likedBy'],
      likes: map['likes'] ?? 0,
      sharedBy: List<String>.from(map['sharedBy'] ?? []),
      comments: (map['comments'] as List).map((comment) => CommentModel.fromMap(comment)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'creator':creator,
      'postTime':postTime,
      'likedBy':likedBy,
      'content': content,
      'likes': likes,
      'sharedBy': sharedBy,
      'comments': comments.map((comment) => CommentModel.fromEntity(comment).toMap()).toList(),
    };
  }
}

class CommentModel extends Comment {
  CommentModel({
    required super.id,
    required super.postId,
    required super.content,
    required super.commenterName,
  });

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'],
      postId: map['postId'],
      content: map['content'],
      commenterName: map['commenterName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'postId': postId,
      'content': content,
      'commenterName': commenterName,
    };
  }

  factory CommentModel.fromEntity(Comment comment) {
    return CommentModel(
      id: comment.id,
      postId: comment.postId,
      content: comment.content,
      commenterName: comment.commenterName,
    );
  }
}
