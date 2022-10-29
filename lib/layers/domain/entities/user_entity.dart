import 'package:intl/intl.dart';

class UserEntity {
  int id;
  String name;
  String email;
  String imagePath;
  DateTime createdAt;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.imagePath,
    required this.createdAt,
  });

  String get createdAtFormatted {
    return DateFormat('dd/MM/yyyy').format(createdAt);
  }
}
