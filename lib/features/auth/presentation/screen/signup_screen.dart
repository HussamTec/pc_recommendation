import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pc_recommendation/features/auth/presentation/screen/signin_screen.dart';
import 'package:pc_recommendation/features/auth/presentation/state_management/auth_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pc_recommendation/features/auth/presentation/widgets/custom_text_field.dart';
import '../../../home/presentation/screen/bottom_bar_wrapper.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final singUpAuthBloc = BlocProvider.of<AuthBloc>(context);

    String email = '';
    String userName = '';
    String password = '';
    String rePassword = '';
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Theme(
          data: ThemeData(primaryColorDark: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Text('Sign up',
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text(
                          'To start your journey',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      email = value;
                    },
                    labelText: 'Email',
                    leadingSvgPath: 'assets/svg_icons/email.svg',
                    isObscure: false,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      userName=value;
                    },
                    labelText: 'Username',
                    leadingSvgPath: 'assets/svg_icons/username.svg',
                    isObscure: false,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      password = value;
                    },
                    labelText: 'Password',
                    leadingSvgPath: 'assets/svg_icons/password.svg',
                    isObscure: true,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      rePassword = value;
                      singUpAuthBloc.add(PasswordMatch(
                          password: password, rePassword: rePassword));
                    },
                    labelText: 'Re-Password',
                    leadingSvgPath: 'assets/svg_icons/password.svg',
                    isObscure: true,
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/svg_icons/signUp.svg',
                        width: 60,
                        height: 60,
                      ),
                      onTap: () {
                        singUpAuthBloc.add(SignUpButtonPressed(
                          userName: userName,
                            email: email,
                            password: password,
                            rePassword: rePassword));
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2.0, // Adjust height for line thickness
                        width: 120.0, // Adjust width for line length
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'OR',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Container(
                        height: 2.0, // Adjust height for line thickness
                        width: 120.0, // Adjust width for line length
                        color: Colors.black,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Text(
                        'Sign Up With',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          child: SvgPicture.asset(
                            'assets/images/android_neutral_rd_na.svg',
                            width: 70,
                            height: 70,
                          ),
                          onTap: () {
                            singUpAuthBloc.add(AuthWithGooglePressed());
                          },
                        ),
                      ) //Google Sign-In SVG
                    ],
                  ),
                  Text('Already have an account?',
                      style: Theme.of(context).textTheme.bodySmall),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        singUpAuthBloc.add(SwitchSignInSignUpButtonPressed());
                      },
                      child: const Text(
                        'Login here',
                        style: TextStyle(
                          fontFamily: "Schyler",
                          fontSize: 13,
                          color: Color(0xFF01C8EE),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess && auth.currentUser != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomBarWrapper()),
                        );
                      }

                      if (state is SwitchSignInSignOut) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),
                        );
                      }
                    },
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is AuthFailure) {
                          return const Text('Sign up failed!');
                        } else if (state is PasswordIsNotMatch) {
                          return const Text(
                            'Password does not match!',
                            style: TextStyle(color: Colors.red),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

