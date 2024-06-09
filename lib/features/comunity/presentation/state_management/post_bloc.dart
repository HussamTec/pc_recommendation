import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pc_recommendation/features/comunity/presentation/state_management/post_bloc_event.dart';
import 'package:pc_recommendation/features/comunity/presentation/state_management/post_bloc_state.dart';
import '../../domain/usecases/post_usecase.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final CreatePost createPost;
  final SharePost sharePost;
  final ToggleLikePost toggleLikePost;
  final AddComment addComment;
  final GetPosts getPosts;

  PostBloc({
    required this.createPost,
    required this.toggleLikePost,
    required this.sharePost,
    required this.addComment,
    required this.getPosts,
  }) : super(PostInitial()) {
    on<GetPostsEvent>((event, emit) async {
      emit(PostLoading());
      try {
        final postsStream = getPosts();
        await emit.forEach(postsStream, onData: (posts) {
          return PostLoaded(posts);
        }, onError: (error, stackTrace) {
          return PostError(error.toString());
        });
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });

    on<CreatePostEvent>((event, emit) async {
      try {
        await createPost(event.post);
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });

    on<ToggleLikePostEvent>((event, emit) async {
      try {
        await toggleLikePost(event.postId, event.userId);
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });

    on<SharePostEvent>((event, emit) async {
      try {
        await sharePost(event.postId, event.userId);
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });

    on<AddCommentEvent>((event, emit) async {
      try {
        await addComment(event.comment);
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
