import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarWidget extends StatelessWidget {
  final void Function(String)? onChanged;

  const SearchBarWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Stack(
      children: [
        Positioned(
          top: 5,
          child: SvgPicture.asset(
            'assets/svg_icons/searchBar.svg',
            height: 40,
            width: 300,
          ),
        ),
        Positioned(

          child: Padding(
            padding: const EdgeInsets.fromLTRB(60,8, 0,0),
            child: SizedBox(
              height:37,
              child: TextField(
                controller: controller,
                onChanged:onChanged,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Looking for something?',
                  hintStyle: TextStyle(color: Colors.white70,fontSize: 15),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
