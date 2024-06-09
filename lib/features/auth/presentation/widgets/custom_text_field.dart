import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String labelText;
  final String leadingSvgPath;
  final bool isObscure;

  const CustomTextField({
    super.key,
    required this.onChanged,
    required this.labelText,
    required this.leadingSvgPath,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            width: 2.5,
            color: const Color(0xFF9C9C9C),
          ), // Set border thickness and color here
        ),
        child: TextFormField(
          keyboardType: TextInputType.name,
          obscureText: isObscure,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 14.0), // Add top padding
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            // Fill the background
            fillColor: const Color(0xFFF2F2F2),
            focusColor: const Color(0xFFFBFBFB),
            border: InputBorder.none,
            // Shows border around the TextField
            focusedBorder: const OutlineInputBorder(
              // Changes border color when focused
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: labelText,
            labelStyle: const TextStyle(
                fontFamily: 'Schyler', color: Color(0xFF919191),fontSize: 10),
            prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  leadingSvgPath, width: 8, // Adjust width as needed
                  height: 8,
                )),
          ),
          cursorColor: Colors.black,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
