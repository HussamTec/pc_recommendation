import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pc_recommendation/features/auth/presentation/screen/signup_screen.dart';
import 'onboarding_third.dart'; // Assuming you have svg images

class OnboardingFourth extends StatelessWidget {
  const OnboardingFourth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SvgPicture.asset(
                  'assets/svg_icons/Start4.svg',
                )),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 1.65,),
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
                          color: Colors.black,
                          size: 10.0,
                        ),
                        SizedBox(width: 5.0), // Spacing between dots
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 10.0,
                        ),
                      ],
                    ),
                  ],
                ),
                // Text below photo and dots with updated content
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0,50,20,20), // Add padding above text
                  child: Text('Also if you are confused about two parts you can compare between them.',
                    style: TextStyle(color: Colors.black,fontSize: 15),
                    textAlign: TextAlign.center, // Center the text
                  ),
                ),
                // Row with SVG images and text
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,80,10,20),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: () {

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnboardingThird()),
                          );
                        },
                        child: SvgPicture.asset(
                            'assets/svg_icons/leftArrow.svg',height: 50,width: 50), // Replace with your SVG asset path
                      ),
                      const SizedBox(width: 50,),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                            );
                          },
                          child: SvgPicture.asset(
                              'assets/svg_icons/continue.svg',height: 55,width: 30), // Replace with your SVG asset path
                        ),
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
