import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pc_recommendation/features/auth/presentation/screen/signup_screen.dart';
import 'package:pc_recommendation/features/onboarding/onboarding_second.dart';

import 'onboarding_fourth.dart'; // Assuming you have svg images

class OnboardingThird extends StatelessWidget {
  const OnboardingThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(
              'assets/svg_icons/Start1.svg',
            )),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.65,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center dots
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 10.0,
                    ),
                    SizedBox(width: 5.0), // Spacing between dots
                    Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 10.0,
                    ),
                    SizedBox(width: 5.0), // Spacing between dots
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 10.0,
                    ),
                    SizedBox(width: 5.0), // Spacing between dots
                    Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 10.0,
                    ),
                  ],
                ),
              ],
            ),
            // Text below photo and dots with updated content
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 50, 20, 20),
              // Add padding above text
              child: Text(
                'Not only that, if you have a problem you can ask other users and you will get an answer.',
                style:TextStyle(color: Colors.black,fontSize: 15),
                textAlign: TextAlign.center, // Center the text
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingSecond()),
                      );
                    },
                    child: SvgPicture.asset('assets/svg_icons/leftArrow.svg',
                        height: 50,
                        width: 50,
                    color: const Color(0xFF0B2994),), // Replace with your SVG asset path
                  ),
                  const SizedBox(width: 105.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child:  const Text(
                      'SKIP',
                      style: TextStyle(
                        fontFamily: 'Schyler',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B2994),
                      ),
                    ),
                  ),
                  const SizedBox(width: 75.0), // Spacing between elements
                  // Text with updated content
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingFourth()),
                      );
                    },
                    child: SvgPicture.asset('assets/svg_icons/skipBtn.svg',
                        height: 70,
                        width: 70), // Replace with your SVG asset path
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
