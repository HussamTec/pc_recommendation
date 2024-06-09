import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/time_ago_helper/time_ago.dart';
import '../../domain/entities/post_entity.dart';
import '../state_management/post_bloc.dart';
import '../state_management/post_bloc_event.dart';
import '../state_management/post_bloc_state.dart';
import '../widgets/post_widget.dart';

class CommunityScreen extends StatelessWidget {
  final TextEditingController _commentController = TextEditingController();
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff17264D),

      appBar: AppBar(
        title: const Center(child: Text('Community',style:
        TextStyle(color: Colors.white),)),
        backgroundColor: const Color(0xff101B37),

      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PostLoaded) {
                  return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      final post = state.posts[index];
                      final isLiked = post.likedBy.contains(uid);
                      return PostWidget(
                          postCreator: post.creator,
                          postTime: timeAgo(post.postTime),
                          postContent: post.content,
                          onTapLike: () {
                            context
                                .read<PostBloc>()
                                .add(ToggleLikePostEvent(post.id, uid));
                          },
                          isLiked: isLiked,
                          likesCount: '${post.likes}',
                          commentController: _commentController,
                          onAddCommentPressed: () async {
                            final content = _commentController.text;
                            if (content.isNotEmpty) {
                              final comment = Comment(
                                id: '',
                                postId: post.id,
                                content: content,
                                commenterName:
                                    await getUserDisplayName(_auth.currentUser),
                              );
                              context
                                  .read<PostBloc>()
                                  .add(AddCommentEvent(comment));
                              _commentController.clear();
                              Navigator.of(context).pop();
                            }
                          },
                          commentsLength: '${post.comments.length}',
                          commentWidget: Column(
                            children: [
                              ...post.comments.map((comment) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:Colors.black12, // Set background color (optional)
                                    borderRadius: BorderRadius.circular(20.0), // Set border radius
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        '${comment.commenterName}'
                                        ': ${comment.content}', style: const TextStyle(fontSize: 20),),
                                  ),
                                ),
                              )),
                            ],
                          ));
                    },
                  );
                } else if (state is PostError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> getUserDisplayName(User? user) async {
  if (user == null) {
    return '';
  }

  if (user.displayName != null && user.displayName!.isNotEmpty) {
    return user.displayName!;
  } else {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('userNames')
        .doc(user.uid)
        .get();

    if (userDoc.exists) {
      return userDoc['username'] ?? '';
    } else {
      return '';
    }
  }
}


