import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavBtn extends StatelessWidget {
  const FavBtn({
    super.key,
    required this.isSelected,
    required this.path,
    required this.onTap,
  });
  final void Function()? onTap;
  final bool isSelected;
  final String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(path),
    );
  }
}
