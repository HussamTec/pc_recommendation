import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/data_source/build_data_source.dart';
import '../../data/repository_implementation/buld_repository_implementation.dart';
import '../../domain/usecase/build_collection_usecase.dart';
import '../state_management/medium_end_bloc/medium_end_bloc.dart';
import '../state_management/medium_end_bloc/medium_end_events.dart';
import '../state_management/medium_end_bloc/medium_end_states.dart';
import '../widget/build_list_item_widget.dart';


class MediumEndScreen extends StatelessWidget {
  const MediumEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MediumEndBloc(
        GetCollectionData(
          CollectionRepositoryImpl(
            CollectionRemoteDataSourceImpl(FirebaseFirestore.instance),
          ),
        ),
      )..add(FetchMediumEndData()),
      child: Scaffold(
        backgroundColor: const Color(0xff17264D),
        appBar: AppBar(
          title: const Text('Medium End Collection',style: TextStyle(color: Colors.white, fontSize: 30),),
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
        body: BlocBuilder<MediumEndBloc, MediumEndState>(
          builder: (context, state) {
            if (state is MediumEndLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MediumEndLoaded) {
              final mediumEndBuilds = state.mediumEndBuilds;

              return ListView.builder(
                itemCount: state.mediumEndBuilds.length,
                itemBuilder: (context, index) {
                  final buildEntity = mediumEndBuilds[index];

                  return BuildListItem(buildEntity);
                },
              );
            } else if (state is MediumEndError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}
