import 'package:intl/intl.dart';

class UserEntity {
  int id;
  String name;
  String email;
  String? base64String;
  DateTime createdAt;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.base64String,
    required this.createdAt,
  });

  String get createdAtFormatted {
    return DateFormat('dd/MM/yyyy').format(createdAt);
  }
}
