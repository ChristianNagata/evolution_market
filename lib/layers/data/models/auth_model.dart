import 'package:evolution_market/layers/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.email,
    required super.password,
  });

  Map<String, String> toMap() {
    return {
      "email": email,
      "senha": password,
    };
  }

  static AuthModel toModel(AuthEntity entity) {
    return AuthModel(
      email: entity.email,
      password: entity.password,
    );
  }
}
