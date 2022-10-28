import 'package:dartz/dartz.dart';
import 'package:evolution_market/core/exceptions.dart';
import 'package:evolution_market/core/failures.dart';
import 'package:evolution_market/layers/data/datasources/auth_datasource/auth_datasource.dart';
import 'package:evolution_market/layers/data/models/auth_model.dart';
import 'package:evolution_market/layers/domain/entities/auth_entity.dart';
import 'package:evolution_market/layers/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl(this._authDatasource);

  @override
  Future<Either<FailureEntity, String>> login(AuthEntity auth) async {
    try {
      AuthModel model = AuthModel.toModel(auth);
      String token = await _authDatasource.login(model);
      return Right(token);
    } on SomethingWentWrongException {
      return const Left(SomethingWentWrongFailure());
    }
  }

  @override
  Future<void> logout() async {
    await _authDatasource.logout();
  }
}
