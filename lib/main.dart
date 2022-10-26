import 'package:evolution_market/core/initializations/inject.dart';
import 'package:evolution_market/core/initializations/system_config.dart';
import 'package:evolution_market/layers/presentation/controllers/home_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/navigation_bar_notifier.dart';
import 'package:evolution_market/layers/presentation/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'layers/presentation/custom_themes/custom_elevated_button_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Inject.init();

  await SystemConfig.init();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<NavigationBarNotifier>(
        create: (_) => GetIt.I.get<NavigationBarNotifier>(),
      ),
      ChangeNotifierProvider<HomeNotifier>(
        create: (_) => GetIt.I.get<HomeNotifier>(),
      ),
    ], child: const MyApp()),
  );
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
