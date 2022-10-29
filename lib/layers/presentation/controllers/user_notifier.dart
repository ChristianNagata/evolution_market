import 'package:evolution_market/layers/domain/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_entity.dart';

// TODO: remove
UserEntity userTest = UserEntity(
  id: 1,
  name: 'Usuário4',
  email: 'usuário4@email.com',
  imagePath: '',
  createdAt: DateTime.parse('2022-10-24T17:55:56.000Z'),
);

class UserNotifier with ChangeNotifier {
  final UserRepository _userRepository;
  late SharedPreferences _prefs;
  UserEntity _data = userTest;

  UserNotifier(this._userRepository) {
    init();
  }

  UserEntity get data => _data;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    int userId = await _getUserId();
    print(userId);
    getUserData(userId);
  }

  Future<int> _getUserId() async {
    String email = _prefs.getString('email')!;
    String sub = email.substring(7, 8);
    return int.parse(sub);
  }

  Future<void> getUserData(int id) async {
    _data = await _userRepository.getUserData(id);
    notifyListeners();
  }
}
