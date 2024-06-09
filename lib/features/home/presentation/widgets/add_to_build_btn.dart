import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class AddToBuildBtn extends StatelessWidget {
  const AddToBuildBtn({
    super.key,
    required this.addToBuildTap,
  });

  final void Function()? addToBuildTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: addToBuildTap,
        child: SvgPicture.asset(
              'assets/svg_icons/add_to_build_btn.svg',
          height: 70,
          width: 70,
        ));
  }
}
