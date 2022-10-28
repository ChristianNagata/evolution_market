import 'package:evolution_market/layers/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.insertionDate,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    // TODO: modify to real data parameter names an types
    return UserModel(
      id: map['id'] as int,
      name: map['nome'] as String,
      email: map['email'] as String,
      insertionDate: map['insertionDate'] as String,
    );
  }
}
