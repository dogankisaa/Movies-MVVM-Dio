import 'package:flutter/material.dart';

TextTheme textTheme() {
  return const TextTheme(
    bodySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 7),
    headlineLarge: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
    headlineMedium: TextStyle(fontWeight: FontWeight.w700, fontSize: 9),
    displayLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
    displaySmall: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)
  );
}
