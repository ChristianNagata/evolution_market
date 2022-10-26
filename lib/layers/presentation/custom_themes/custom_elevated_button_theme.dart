import 'package:flutter/material.dart';

ElevatedButtonThemeData customElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
  );
}
