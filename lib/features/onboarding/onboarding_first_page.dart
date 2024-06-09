import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pc_recommendation/features/auth/presentation/screen/signup_screen.dart';
import 'package:pc_recommendation/features/onboarding/onboarding_second.dart'; // Assuming you have svg images

class OnboardingFirst extends StatelessWidget {
  const OnboardingFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset('assets/svg_icons/Start1.svg',
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
                      color: Colors.green,
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
                      color: Colors.black,
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
                'Welcome to TechAdvisor! Are you tired of your old PC?',
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontSize: 25.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center, // Center the text
              ),
            ),
            // Row with SVG images and text
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // First SVG image wrapped in GestureDetector (unchanged)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        fontFamily: 'Schyler',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 90.0), // Spacing between elements
                  // Text with updated content
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingSecond()),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/svg_icons/skipBtn.svg',
                      height: 70,
                      width: 70,
                    ), // Replace with your SVG asset path
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
