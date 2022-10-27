import 'package:evolution_market/layers/data/datasources/auth_datasource/auth_datasource.dart';
import 'package:evolution_market/layers/data/datasources/auth_datasource/auth_datasource_impl.dart';
import 'package:evolution_market/layers/data/datasources/product_datasource/product_datasource.dart';
import 'package:evolution_market/layers/data/datasources/product_datasource/product_datasource_impl.dart';
import 'package:evolution_market/layers/data/repositories/auth_repository_impl.dart';
import 'package:evolution_market/layers/data/repositories/product_repository_impl.dart';
import 'package:evolution_market/layers/domain/repositories/auth_repository.dart';
import 'package:evolution_market/layers/domain/repositories/product_repository.dart';
import 'package:evolution_market/layers/presentation/controllers/auth_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/home_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/navigation_bar_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/product_notifier.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    final GetIt getIt = GetIt.I;

    // databases
    getIt.registerLazySingleton<ProductDatasource>(() => ProductDatasourceImpl());
    getIt.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl());
    // repositories
    getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(getIt()));
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()));
    // usecases
    // ---
    // controllers
    getIt.registerSingleton<ProductNotifier>(ProductNotifier(getIt()));
    getIt.registerSingleton<AuthNotifier>(AuthNotifier(getIt()));

    getIt.registerSingleton<NavigationBarNotifier>(NavigationBarNotifier());
    getIt.registerSingleton<HomeNotifier>(HomeNotifier());
  }
}
