import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/data_source/build_data_source.dart';
import '../../data/repository_implementation/buld_repository_implementation.dart';
import '../../domain/usecase/build_collection_usecase.dart';
import '../widget/build_list_item_widget.dart';
import '../state_management/high_end_bloc/high_end_bloc.dart';
import '../state_management/high_end_bloc/high_end_events.dart';
import '../state_management/high_end_bloc/high_end_states.dart';

class HighEndScreen extends StatelessWidget {
  const HighEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HighEndBloc(
        GetCollectionData(
          CollectionRepositoryImpl(
            CollectionRemoteDataSourceImpl(FirebaseFirestore.instance),
          ),
        ),
      )..add(FetchHighEndData()),
      child: Scaffold(
        backgroundColor: const Color(0xff17264D),
        appBar: AppBar(
          title: const Text('High End Collection',style: TextStyle(color: Colors.white),),
          backgroundColor: const Color(0xFF17264D),
          leading: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/svg_icons/blackBackButton.svg',
                height: 30,
                width: 10,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: BlocBuilder<HighEndBloc, HighEndState>(
          builder: (context, state) {
            if (state is HighEndLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HighEndLoaded) {
              final highEndBuilds = state.highEndBuilds;

              return ListView.builder(
                itemCount: state.highEndBuilds.length,
                itemBuilder: (context, index) {
                  final buildEntity = highEndBuilds[index];

                  return BuildListItem(buildEntity);
                },
              );
            } else if (state is HighEndError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}
