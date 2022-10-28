import 'package:evolution_market/layers/data/datasources/auth_datasource/auth_datasource.dart';
import 'package:evolution_market/layers/data/datasources/auth_datasource/auth_datasource_impl.dart';
import 'package:evolution_market/layers/data/datasources/product_datasource/product_datasource.dart';
import 'package:evolution_market/layers/data/datasources/product_datasource/product_datasource_impl.dart';
import 'package:evolution_market/layers/data/datasources/user_datasource/user_datasource.dart';
import 'package:evolution_market/layers/data/repositories/auth_repository_impl.dart';
import 'package:evolution_market/layers/data/repositories/product_repository_impl.dart';
import 'package:evolution_market/layers/domain/repositories/auth_repository.dart';
import 'package:evolution_market/layers/domain/repositories/product_repository.dart';
import 'package:evolution_market/layers/domain/repositories/user_repository.dart';
import 'package:evolution_market/layers/presentation/controllers/auth_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/home_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/navigation_bar_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/product_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/user_notifier.dart';
import 'package:get_it/get_it.dart';
import '../../layers/data/datasources/user_datasource/user_datasource_impl.dart';
import '../../layers/data/repositories/user_repository_impl.dart';

class Inject {
  static void init() {
    final GetIt getIt = GetIt.I;

    // databases
    getIt.registerLazySingleton<ProductDatasource>(() => ProductDatasourceImpl());
    getIt.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl());
    getIt.registerLazySingleton<UserDatasource>(() => UserDatasourceImpl());
    // repositories
    getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(getIt()));
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()));
    getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()));
    // usecases
    // ---
    // controllers
    getIt.registerLazySingleton<ProductNotifier>(() => ProductNotifier(getIt()));
    getIt.registerSingleton<AuthNotifier>(AuthNotifier(getIt()));
    getIt.registerSingleton<UserNotifier>(UserNotifier(getIt()));

    getIt.registerSingleton<NavigationBarNotifier>(NavigationBarNotifier());
    getIt.registerSingleton<HomeNotifier>(HomeNotifier());
  }
}
