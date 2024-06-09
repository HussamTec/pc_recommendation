import 'package:flutter/material.dart';

class BlackGradientLine extends StatelessWidget {
  const BlackGradientLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3, // Adjust the height of the line
      width: MediaQuery.of(context).size.width, // Adjust the width of the line
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ),
      ),
    );
  }
}
