import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/custom_bottom_bar/custom_bottom_bar_bloc/custom_bottom_bar_bloc.dart';
import 'features/custom_bottom_bar/custom_bottom_bar_bloc/custom_bottom_bar_event.dart';



class BackyardScreen extends StatelessWidget {
  const BackyardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomBarBloc bottomBarBloc = BlocProvider.of<BottomBarBloc>(context);

    // Dispatch an event to set the initial index
    bottomBarBloc.add(const BottomBarEvent.selectIndex(1));
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Backyard',
              style: TextStyle(
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          backgroundColor: const Color(0xFF101B37),
        ),
        backgroundColor: const Color(0xFF18264D),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/comingSoon.png'),)

          ],)
    );
  }
}
