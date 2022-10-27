import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<void> login(AuthEntity auth);

  Future<void> logout();
}
