import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerBtnWidget extends StatelessWidget {
  final void Function()? onTap;
  final String svgPath;
  final String btnName;
  const DrawerBtnWidget({
    required this.onTap,
    required this.svgPath,
    required this.btnName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(27.0,10,10,10),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(svgPath,
                height: 33,
                width: 33,),
            ),
             Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(btnName, style: const TextStyle(color: Colors.white,
                fontSize: 27, fontWeight:FontWeight.bold,
              )),
            )
          ],),
      ),
    );
  }
}
