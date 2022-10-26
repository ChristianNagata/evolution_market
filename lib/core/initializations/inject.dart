import 'package:evolution_market/layers/presentation/controllers/home_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/navigation_bar_notifier.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    final GetIt getIt = GetIt.I;

    // databases
    // repositories
    // usecases
    // controllers
    getIt.registerSingleton<NavigationBarNotifier>(NavigationBarNotifier());
    getIt.registerSingleton<HomeNotifier>(HomeNotifier());
  }
}
