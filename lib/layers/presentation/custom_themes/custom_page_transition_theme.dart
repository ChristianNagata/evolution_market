import 'package:flutter/material.dart';

PageTransitionsTheme customPageTransitionTheme() {
  return const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );
}
