import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/data_source/build_data_source.dart';
import '../../data/repository_implementation/buld_repository_implementation.dart';
import '../../domain/usecase/build_collection_usecase.dart';
import '../state_management/low_end_bloc/low_end_bloc.dart';
import '../state_management/low_end_bloc/low_end_events.dart';
import '../state_management/low_end_bloc/low_end_states.dart';
import '../widget/build_list_item_widget.dart';


class LowEndScreen extends StatelessWidget {
  const LowEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LowEndBloc(
        GetCollectionData(
          CollectionRepositoryImpl(
            CollectionRemoteDataSourceImpl(FirebaseFirestore.instance),
          ),
        ),
      )..add(FetchLowEndData()),
      child: Scaffold(
        backgroundColor: const Color(0xff17264D),
        appBar: AppBar(
          title: const Text('Low End Collection',style: TextStyle(color: Colors.white),),
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
        body: BlocBuilder<LowEndBloc, LowEndState>(
          builder: (context, state) {
            if (state is LowEndLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LowEndLoaded) {
              final lowEndBuilds = state.lowEndBuilds;

              return ListView.builder(
                itemCount: state.lowEndBuilds.length,
                itemBuilder: (context, index) {
                  final buildEntity = lowEndBuilds[index];

                  return BuildListItem(buildEntity);
                },
              );
            } else if (state is LowEndError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}
