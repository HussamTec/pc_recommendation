import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/time_ago_helper/time_ago.dart';
import '../../../comunity/domain/entities/post_entity.dart';
import '../../../comunity/presentation/state_management/post_bloc.dart';
import '../../../comunity/presentation/state_management/post_bloc_event.dart';
import '../../../comunity/presentation/state_management/post_bloc_state.dart';
import '../../../comunity/presentation/widgets/post_widget.dart';
import '../../../home/presentation/widgets/profile_image_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final mediaQuerySize = MediaQuery.of(context).size;
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    final TextEditingController commentController = TextEditingController();
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: mediaQuerySize.width / 12,
            )),
        title: Padding(
          padding: EdgeInsets.only(left: mediaQuerySize.width / 7),
          child: const Text(
            'Your Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: mediaQuerySize.width / 20),
            child: SvgPicture.asset(
              'assets/svg_icons/settings.svg',
              height: mediaQuerySize.width / 15,
            ),
          )
        ],
        backgroundColor: const Color(0xff101B37),
      ),
      backgroundColor: const Color(0xff17264D),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: const Color(0xff17264D),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildProfileImage(user, mediaQuerySize.width / 4,
                        mediaQuerySize.width / 4),
                    const SizedBox(height: 10),
                    FutureBuilder<String>(
                      future: getUserDisplayName(user),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ); // Access the data using snapshot.data!
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}"); // Handle errors
                        }
                        // Display a loading indicator while waiting for the future
                        return const CircularProgressIndicator();
                      },
                    ),
                    const SizedBox(height: 10),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'FOLLOWING',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'FOLLOWERS',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'About',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Content creator.\nMadridista.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Feed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 500,
                      width: 600,
                      child: Column(
                        children: [
                          Expanded(
                            child: BlocBuilder<PostBloc, PostState>(
                              builder: (context, state) {
                                if (state is PostLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (state is PostLoaded) {
                                  return ListView.builder(
                                    itemCount: state.posts.length,
                                    itemBuilder: (context, index) {
                                      final post = state.posts[index];
                                      final isLiked =
                                          post.likedBy.contains(uid);
                                       bool isCreator=true;
                                      getUserDisplayName(user).then((data) {
                                        if (post.creator == data) {
                                          return isCreator=true;
                                        } else {
                                          return isCreator=false;
                                        }
                                      });
                                      return isCreator?
                                      PostWidget(
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
                                          commentController: commentController,
                                          onAddCommentPressed: () async {
                                            final content = commentController.text;
                                            if (content.isNotEmpty) {
                                              final comment = Comment(
                                                id: '',
                                                postId: post.id,
                                                content: content,
                                                commenterName:
                                                await getUserDisplayName(user),
                                              );
                                              context
                                                  .read<PostBloc>()
                                                  .add(AddCommentEvent(comment));
                                              commentController.clear();
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          commentsLength: '${post.comments.length}',
                                          commentWidget: Column(
                                            children: [
                                              ...post.comments.map((comment) => Container(
                                                color:Colors.black12,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    '${comment.commenterName}'
                                                        ': ${comment.content}', style: const TextStyle(fontSize: 20),),
                                                ),
                                              )),
                                            ],
                                          )): Container(height: 100,
                                      width: 100,color: Colors.white,);
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 730,
            left: 330,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Add Post'),
                      content: Container(
                        height: 400,
                        width: 300,
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            labelText: 'Create a post',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () async {
                            final content = controller.text;
                            final creator = await getUserDisplayName(user);
                            if (content.isNotEmpty) {
                              final post = Post(
                                  id: '',
                                  content: content,
                                  likedBy: [],
                                  creator: creator,
                                  postTime: DateTime.now());
                              context
                                  .read<PostBloc>()
                                  .add(CreatePostEvent(post));
                              controller.clear();
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Post'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff101B37),
                    // Set background color (optional)
                    borderRadius:
                        BorderRadius.circular(50.0), // Set border radius
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
