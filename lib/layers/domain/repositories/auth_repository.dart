import 'package:dartz/dartz.dart';
import 'package:evolution_market/core/failures.dart';

import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<FailureEntity, String>> login(AuthEntity auth);
}
