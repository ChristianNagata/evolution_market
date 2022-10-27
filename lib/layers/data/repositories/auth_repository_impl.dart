import 'package:evolution_market/layers/data/datasources/auth_datasource/auth_datasource.dart';
import 'package:evolution_market/layers/data/models/auth_model.dart';
import 'package:evolution_market/layers/domain/entities/auth_entity.dart';
import 'package:evolution_market/layers/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl(this._authDatasource);

  @override
  Future<void> login(AuthEntity auth) async {
    AuthModel model = AuthModel.toModel(auth);
    await _authDatasource.login(model);
  }

  @override
  Future<void> logout() async {
    await _authDatasource.logout();
  }
}
