import 'package:evolution_market/layers/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.base64String,
    required super.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['nome'] as String,
      email: map['email'] as String,
      base64String: map['foto'] as String,
      createdAt: DateTime.parse(map['createdAt'].toString()),
    );
  }

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      base64String: model.base64String,
      createdAt: model.createdAt,
    );
  }
}
