import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../custom_bottom_bar_bloc/custom_bottom_bar_bloc.dart';
import '../custom_bottom_bar_bloc/custom_bottom_bar_event.dart';
import '../custom_bottom_bar_bloc/custom_bottom_bar_state.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return BlocBuilder<BottomBarBloc, BottomBarState>(
      builder: (context, state) {
        return Container(
          color:  const Color(0xff17264D),

          child: Stack(
            children:[
            Positioned(
              top: 15,
              width: queryData.size.width,
              child: Container(
                color: Colors.transparent,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff101B37),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ), // Adjust the radius as needed
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBottomNavItem(
                        context,
                        'assets/bottom_bar_icons/backyard.svg', // SVG asset path
                        1,
                        state,
                      ),
                      _buildBottomNavItem(
                        context,
                        'assets/bottom_bar_icons/benchmark.svg', // SVG asset path
                        0,
                        state,
                      ),

                      const SizedBox(width: 20,),
                      _buildBottomNavItem(
                        context,
                        'assets/bottom_bar_icons/community.svg', // SVG asset path
                        3,
                        state,
                      ),
                      _buildBottomNavItem(
                        context,
                        'assets/bottom_bar_icons/build icon.svg', // SVG asset path
                        4,
                        state,
                      ),

                    ],
                  ),),
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/Ellipse88.png'),
                      _buildBottomNavItem(
                        context,
                        'assets/bottom_bar_icons/homescreenBlack.svg', // SVG asset path
                        2,
                        state,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNavItem(
      BuildContext context,
      String svgAssetPath,
      int index,
      BottomBarState state,
      ) {
    final isSelected = state.maybeMap(
      selected: (selectedState) => selectedState.index == index,
      orElse: () => false,
    );

    return GestureDetector(
      onTap: () {
        BlocProvider.of<BottomBarBloc>(context).add(BottomBarEvent.selectIndex(index));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgAssetPath,
            color: isSelected ? Colors.black : Colors.white, // Set SVG color
            width: 24, // Set width of SVG
            height: 24, // Set height of SVG
          ),
        ],
      ),
    );
  }
}
