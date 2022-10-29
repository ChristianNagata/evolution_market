import 'package:evolution_market/layers/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUserData(int id);
  Future<List<UserEntity>> getUsers();
}
