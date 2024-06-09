import 'package:flutter/material.dart';

const TextStyle titleLarge = TextStyle(
  fontFamily: 'Schyler',
  fontSize: 32.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const TextStyle bodyLarge = TextStyle(
  fontFamily: 'Schyler',
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
const TextStyle bodyMedium = TextStyle(
  fontFamily: 'Schyler',
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
const TextStyle bodySmall = TextStyle(
  fontFamily: 'Schyler',
  fontSize: 13.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

// Define styles for other text types (bodyText, caption, etc.)

TextTheme appTextTheme = const TextTheme(
  titleLarge: titleLarge,
  bodyLarge: bodyLarge,
  bodyMedium: bodyMedium,
  bodySmall: bodySmall,
  // Assign other styles to remaining TextTheme properties
);
