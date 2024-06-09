// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';
//
// class CustomBottomNavigationBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onTabChanged;
//
//   const CustomBottomNavigationBar({super.key,
//     required this.selectedIndex,
//     required this.onTabChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBottomNavigationBar.builder(
//       itemCount: 5,
//       tabBuilder: (index, isActive) {
//
//         final String  svgIconPath;
//         switch (index) {
//           case 0:
//             svgIconPath = 'assets/bottom_bar_icons/benchmark.svg';
//             break;
//           case 1:
//             svgIconPath = 'assets/bottom_bar_icons/backyard.svg';
//             break;
//           case 2:
//             svgIconPath = 'assets/bottom_bar_icons/homescreenBlack.svg';
//             break;
//           case 3:
//             svgIconPath = 'assets/bottom_bar_icons/community.svg';
//           case 4:
//             svgIconPath = 'assets/bottom_bar_icons/build icon.svg';
//             break;
//           default:
//             svgIconPath = 'assets/bottom_bar_icons/homescreenBlack.svg';
//         }
//         return  Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               svgIconPath,
//               width: 30,
//               height: 30,
//               color: isActive?Colors.black: Colors.white,
//             ),
//           ],
//         );
//       },
//       activeIndex: selectedIndex,
//       splashColor: Colors.white,
//       height: 65,
//       gapLocation: GapLocation.end, // Ensure the gap is in the center
//       gapWidth: 0, // Set the gap width to 0 to remove it
//       notchSmoothness: NotchSmoothness.smoothEdge,
//       backgroundColor: const Color(0xff101B37),
//       onTap: onTabChanged,
//     );
//   }
// }
