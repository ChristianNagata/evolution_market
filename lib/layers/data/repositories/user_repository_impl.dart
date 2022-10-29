import 'package:evolution_market/layers/data/datasources/user_datasource/user_datasource.dart';
import 'package:evolution_market/layers/data/models/user_model.dart';
import 'package:evolution_market/layers/domain/entities/user_entity.dart';
import 'package:evolution_market/layers/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _userDatasource;

  UserRepositoryImpl(this._userDatasource);

  @override
  Future<UserEntity> getUserData(int id) async {
    UserModel model = await _userDatasource.getUserData(id);
    UserEntity entity = UserModel.toEntity(model);
    return entity;
  }

  @override
  Future<List<UserEntity>> getUsers() async {
    List<UserModel> userModels = await _userDatasource.getUsers();
    List<UserEntity> userEntities =
        userModels.map((e) => UserModel.toEntity(e)).toList();
    return userEntities;
  }
}
