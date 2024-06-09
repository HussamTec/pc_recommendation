import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pc_recommendation/features/home/domain/entities/news_entity.dart';
import '../state_management/firebase_data_bloc/firebase_data_bloc.dart';
import '../state_management/firebase_data_bloc/firebase_data_events.dart';
import '../state_management/firebase_data_bloc/firebase_data_states.dart';
import '../widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsEntity? newsEntity;

    return Scaffold(
      backgroundColor: const Color(0xFF101B37),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 110),
          child: Text(
            'News',
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
      body: BlocBuilder<FirebaseDataSourceBloc, FirebaseDataSourceState>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (news) => ListView.builder(
              itemCount: news!.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      NewsCard(
                          newsEntity: newsEntity,
                          imageUrl: news[index].imageUrl,
                          title: news[index].title,
                          bodyText: news[index].bodyText),
                    ],
                  ),
                );
              },
            ),
            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }
}
