import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../backyard_screen.dart';
import '../../../benchmark/presentation/screens/benchmark_screen.dart';
import '../../../build/presentation/screens/build_screen.dart';
import '../../../comunity/presentation/screen/community_screen.dart';
import '../../../custom_bottom_bar/custom_bottom_bar_bloc/custom_bottom_bar_bloc.dart';
import '../../../custom_bottom_bar/custom_bottom_bar_bloc/custom_bottom_bar_state.dart';
import '../../../custom_bottom_bar/widget/custom_bottom_bar.dart';
import 'home_screen.dart';

class BottomBarWrapper extends StatelessWidget {
  const BottomBarWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarBloc, BottomBarState>(
      builder: (context, state) {
        return Scaffold(
          body: buildScreen(state.index), // Implement this method
          bottomNavigationBar: const CustomBottomNavigationBar(),
        );
      },
    );
  }

  Widget buildScreen(int index) {
    switch (index) {
      case 0:
        return const BenchmarkScreen();
      case 1:return const BackyardScreen();
      case 2:return const HomeScreen();
      case 3:return  CommunityScreen();
      case 4:return const BuildScreen();
    // Add cases for other screens
      default:
        return Container();
    }
  }
}
