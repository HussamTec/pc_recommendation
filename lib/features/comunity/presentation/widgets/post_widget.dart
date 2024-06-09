import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostWidget extends StatelessWidget {
  final String postCreator;
  final String postTime;
  final String postContent;
  final void Function()? onTapLike;
  final bool isLiked;
  final String likesCount;
  final TextEditingController commentController;
  final void Function()? onAddCommentPressed;
  final String commentsLength;
  final Widget commentWidget;

  const PostWidget({
    super.key,
    required this.postCreator,
    required this.postTime,
    required this.postContent,
    required this.onTapLike,
    required this.isLiked,
    required this.likesCount,
    required this.commentController,
    required this.onAddCommentPressed,
    required this.commentsLength,
    required this.commentWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color(0xFF192841), // Background color of the card
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                NetworkImage('https://via.placeholder.com/150'),
                // Replace with your image URL
                radius: 20,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postCreator,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    postTime,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            postContent,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onTapLike,
                        child: isLiked
                            ? SvgPicture.asset(
                          'assets/svg_icons/heart_red.svg',
                          height: 20,
                          width: 20,
                        )
                            : SvgPicture.asset(
                          'assets/svg_icons/heart.svg',
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Text(
                    likesCount,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                      "assets/svg_icons/comment.svg",
                      height: 20,
                      width: 20,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Center(child: Text('Comments',style: TextStyle(fontSize: 30),)),
                            content: SizedBox(
                              width: 600,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  commentWidget,
                                  TextField(
                                    controller: commentController,
                                    decoration: const InputDecoration(
                                      labelText: 'Add comment',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: onAddCommentPressed,
                                child: const Text('Add comment'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 5),
                  Text(
                    commentsLength,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.bookmark_border, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
