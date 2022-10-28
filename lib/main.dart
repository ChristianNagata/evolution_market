import 'package:evolution_market/core/initializations/inject.dart';
import 'package:evolution_market/core/initializations/system_config.dart';
import 'package:evolution_market/layers/presentation/controllers/auth_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/home_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/navigation_bar_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/product_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/user_notifier.dart';
import 'package:evolution_market/layers/presentation/custom_themes/custom_page_transition_theme.dart';
import 'package:evolution_market/layers/presentation/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'layers/presentation/custom_themes/custom_elevated_button_theme.dart';
import 'layers/presentation/ui/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Inject.init();

  await SystemConfig.init();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ProductNotifier>(
        create: (_) => GetIt.I.get<ProductNotifier>(),
      ),
      ChangeNotifierProvider<AuthNotifier>(
        create: (_) => GetIt.I.get<AuthNotifier>(),
      ),
      ChangeNotifierProvider<UserNotifier>(
        create: (_) => GetIt.I.get<UserNotifier>(),
      ),
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
        pageTransitionsTheme: customPageTransitionTheme(),
        fontFamily: 'OpenSans',
        primarySwatch: Colors.blue,
        primaryColor: const Color.fromRGBO(59, 130, 246, 1),
        unselectedWidgetColor: const Color.fromRGBO(209, 209, 209, 1),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Color.fromRGBO(162, 165, 183, 1)),
        ),
        backgroundColor: Colors.white,
        elevatedButtonTheme: customElevatedButtonTheme(),
      ),
      home: Login(),
    );
  }
}
