import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pc_recommendation/features/auth/presentation/screen/signup_screen.dart';
import 'package:pc_recommendation/features/auth/presentation/state_management/auth_bloc.dart';
import '../../../home/presentation/screen/bottom_bar_wrapper.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signInAuthBloc = BlocProvider.of<AuthBloc>(context);

    String email = '';
    String password = '';
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20.0, 70, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Login', style: Theme.of(context).textTheme.bodyLarge),
                  Text(
                    'To continue your journey',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
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
                  password = value;
                },
                labelText: 'Password',
                leadingSvgPath: 'assets/svg_icons/password.svg',
                isObscure: true,
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  child: SvgPicture.asset(
                    'assets/svg_icons/signIn.svg',
                    width: 60,
                    height: 60,
                  ),
                  onTap: () {
                    signInAuthBloc.add(
                        SignInButtonPressed(email: email, password: password));
                  },
                ),
              ), // SignIn button
              const SizedBox(height: 20.0),
              Center(
                child: Row(
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
              ),
              Column(
                children: [
                  Text(
                    'Sign In With',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/images/android_neutral_rd_na.svg',
                        width: 60,
                        height: 60,
                      ),
                      onTap: () {
                        signInAuthBloc.add(AuthWithGooglePressed());
                      },
                    ),
                  ) //Google Sign-In SVG
                ],
              ),
              Text('Don\'t have an account?',
                  style: Theme.of(context).textTheme.bodySmall),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    signInAuthBloc.add(SwitchSignInSignUpButtonPressed());
                  },
                  child: const Text(
                    'Sign Up here',
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
                          builder: (context) => const SignUpScreen()),
                    );
                  }
                },
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is AuthFailure) {
                      return const Text('Sign in failed!');
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
    );
  }
}
