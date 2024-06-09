class Post {
  final String id;
  final String content;
  final String creator;
  final DateTime postTime;
  final int likes;
  final List<dynamic> likedBy;
  final List<String> sharedBy;
  final List<Comment> comments;

  Post({
    required this.id,
    required this.content,
    required this.postTime,
    required this.creator,
    required this.likedBy,
    this.likes = 0,
    this.sharedBy = const [],
    this.comments = const [],
  });
}

class Comment {
  final String id;
  final String postId;
  final String content;
  final String commenterName;

  Comment({
    required this.id,
    required this.postId,
    required this.content,
    required this.commenterName,
  });
}
