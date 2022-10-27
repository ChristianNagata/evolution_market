
import 'package:evolution_market/layers/data/models/auth_model.dart';

abstract class AuthDatasource {
  Future<void> login(AuthModel auth);
  Future<void> logout();
}