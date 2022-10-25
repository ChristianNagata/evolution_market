import 'package:evolution_market/core/initializations/system_config.dart';
import 'package:flutter/material.dart';

import 'layers/presentation/ui/screens/login.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Login(),
    );
  }
}
