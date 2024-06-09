import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pc_recommendation/features/home/domain/entities/news_entity.dart';
import '../state_management/firebase_data_bloc/firebase_data_bloc.dart';
import '../state_management/firebase_data_bloc/firebase_data_states.dart';
import '../widgets/news_card.dart';
import '../widgets/profile_image_builder.dart';

class SavedPostsScreen extends StatelessWidget {
  const SavedPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsEntity? newsEntity;

    return Scaffold(
      backgroundColor: const Color(0xFF101B37),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 110),
          child: Text(
            'Saved Posts',
            style: TextStyle(
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/svg_icons/blackBackButton.svg',
              height: 10,
              width: 10,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF101B37),
      ),
      body: Column(children: [
        _buildPostCard(context),
      ],),
    );
  }
}

Widget _buildPostCard(context) {
  final User? user = FirebaseAuth.instance.currentUser;
  final mediaQuerySize= MediaQuery.of(context).size;
  return Card(
    color: const Color(0xFF212B46),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child:  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              buildProfileImage(user,mediaQuerySize.width/12,mediaQuerySize.width/12),

              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '7os_4',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '1 h',
                    style: TextStyle(
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
          const Text(
            'This text is only 3 sentences long, but it still includes all of the important information. It is also clear, simple, and personalized.\nI hope this helps!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.favorite_border, color: Colors.white),
              SizedBox(width: 5),
              Text(
                '1',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 20),
              Icon(Icons.comment, color: Colors.white),
              SizedBox(width: 5),
              Text(
                '0',
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Icon(Icons.bookmark_border, color: Colors.white),
            ],
          ),
        ],
      ),
    ),
  );
}
