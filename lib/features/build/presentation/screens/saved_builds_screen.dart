import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../domain/entities/build_entity.dart';
import '../widget/build_list_item_widget.dart';
import '../state_management/save_builds_bloc/saved_builds_bloc.dart';


class SavedBuildsScreen extends StatelessWidget {
  const SavedBuildsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SavedBuildsBloc>(context); // Obtain the Bloc
    bloc.add(LoadSavedBuilds()); // Dispatch the event

    return Scaffold(
      backgroundColor: const Color(0xff17264D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF17264D),
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Saved Builds',
            style: TextStyle(color: Colors.white, fontSize: 25),
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
              height: 30,
              width: 10,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<SavedBuildsBloc, SavedBuildsState>( // Use BlocBuilder
              builder: (context, state) {
                if (state is SavedBuildsInitial) {
                  return const Center(
                      child: CircularProgressIndicator()); // Show loading indicator initially
                } else if (state is SavedBuildsLoaded) {
                  final savedBuilds = state.savedBuilds;
                  return ListView.builder( // Build the ListView.builder
                    shrinkWrap: true, // Prevent excessive scrolling space
                    itemCount: savedBuilds.length,
                    itemBuilder: (context, index) {
                      final buildEntity = savedBuilds[index];
                      return BuildListItem(buildEntity); // Your custom list item widget
                    },
                  );
                } else if (state is SavedBuildError) {
                  return Center(
                    child: Text(
                      'Error loading builds: ${state.error}',
                      // Display error message
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Container(); // Handle unexpected states or empty container
              },
            ),
          ],
        ),
      ),
    );
  }
}

