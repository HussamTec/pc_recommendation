import 'package:equatable/equatable.dart';
import '../../domain/entities/post_entity.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class CreatePostEvent extends PostEvent {
  final Post post;

  const CreatePostEvent(this.post);

  @override
  List<Object> get props => [post];
}

class ToggleLikePostEvent extends PostEvent {
  final String postId;
  final String userId;
  const ToggleLikePostEvent(this.postId, this.userId);
}

class SharePostEvent extends PostEvent {
  final String postId;
  final String userId;

  const SharePostEvent(this.postId, this.userId);

  @override
  List<Object> get props => [postId, userId];
}

class AddCommentEvent extends PostEvent {
  final Comment comment;

  const AddCommentEvent(this.comment);

  @override
  List<Object> get props => [comment];
}

class GetPostsEvent extends PostEvent {}
