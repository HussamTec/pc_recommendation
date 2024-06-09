import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pc_recommendation/features/home/presentation/widgets/profile_image_builder.dart';
import 'drawer_btn_widget.dart';

class DrawerComponentWidget extends StatelessWidget {
  final void Function()? logoutTapped;
  final void Function()? goToProfileTapped;
  final void Function()? wishlistTapped;
  final void Function()? savedBuildsTapped;
  final void Function()? contactUsTapped;
  final void Function()? facebookTapped;
  final void Function()? instagramTapped;
  final void Function()? twitterTapped;
  final void Function()? savedPostsTapped;

  const DrawerComponentWidget(
      {super.key, required this.user,
        required this.logoutTapped,
        required this.goToProfileTapped,
        required this.wishlistTapped,
        required this.contactUsTapped,
        required this.facebookTapped,
        required this.instagramTapped,
        required this.twitterTapped,
        required this.savedBuildsTapped,
        required this.savedPostsTapped,
      });

  final User? user;
  @override
  Widget build(BuildContext context) {
    final mediaQuerySize=MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildProfileImage(user,mediaQuerySize.width/4,mediaQuerySize.width/4),
        FutureBuilder(
          future: getUserDisplayName(user),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              String displayName = snapshot.data as String;
              return Text(
                displayName,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              );
            }
          },
        ),
        GestureDetector(
            onTap: goToProfileTapped,
            child: const Text(
              'Go To Profile',
              style: TextStyle(color: Colors.green),
            )),
        DrawerBtnWidget(
            onTap: wishlistTapped,
            btnName: 'Wishlist',
            svgPath: 'assets/svg_icons/wishlist.svg'),
        DrawerBtnWidget(
            onTap: savedPostsTapped,
            btnName: 'Saved posts',
            svgPath: 'assets/svg_icons/savedPosts.svg'),
        DrawerBtnWidget(
            onTap: () {},
            btnName: 'Setting',
            svgPath: 'assets/svg_icons/settings.svg'),
        DrawerBtnWidget(
            onTap: savedBuildsTapped,
            btnName: 'Saved builds',
            svgPath: 'assets/svg_icons/savedBuilds.svg'),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              DrawerBtnWidget(
                  onTap: logoutTapped,
                  btnName: 'Logout',
                  svgPath: 'assets/svg_icons/logOut.svg'),
              DrawerBtnWidget(
                  onTap: contactUsTapped,
                  btnName: 'Contact us',
                  svgPath: 'assets/svg_icons/contactUs.svg'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap:facebookTapped,
                child: SvgPicture.asset(
                  'assets/svg_icons/facebook.svg',
                  height: 30,
                  width: 30,
                ),
              ),
              GestureDetector(
                onTap: twitterTapped,
                child: SvgPicture.asset(
                  'assets/svg_icons/x-social-media-black-icon.svg',color: Colors.white,
                  height: 30,
                  width: 30,
                ),
              ),
              GestureDetector(
                onTap: instagramTapped,
                child: SvgPicture.asset(
                  'assets/svg_icons/instagram.svg',
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(27, 30, 27, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Terms Of Use',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )),
              GestureDetector(
                onTap: () {},
                child: const Text('Privacy Policy',
                    style: TextStyle(color: Colors.white, fontSize: 14)),
              )
            ],
          ),
        ),
        const Text(
          'Version v1.00',
          style: TextStyle(color: Colors.white60),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(8.0, 15, 8, 0),
          child: Text(
            '2023 SpecCave. All rights reserved.',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        )
      ],
    );
  }
}