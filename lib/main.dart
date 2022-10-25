import 'package:evolution_market/core/initializations/system_config.dart';
import 'package:evolution_market/layers/presentation/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'layers/presentation/custom_themes/custom_eleveted_button_theme.dart';

import 'layers/presentation/ui/screens/login.dart';
import 'layers/presentation/ui/screens/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemConfig.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EvoMarket',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primarySwatch: Colors.blue,
        elevatedButtonTheme: customElevatedButtonTheme(),
      ),
      home: const Home(),
    );
  }
}
