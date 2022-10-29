import 'package:evolution_market/layers/domain/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_entity.dart';

// TODO: remove
UserEntity userTest = UserEntity(
  id: 1,
  name: 'Usuário4',
  email: 'usuário4@email.com',
  base64String: '',
  createdAt: DateTime.parse('2022-10-24T17:55:56.000Z'),
);

class UserNotifier with ChangeNotifier {
  final UserRepository _userRepository;
  late SharedPreferences _prefs;
  UserEntity _data = userTest;
  List<UserEntity> _users = [userTest];

  UserNotifier(this._userRepository) {
    init();
  }

  UserEntity get data => _data;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    int userId = await _getUserId();
    getUserData(userId);
    notifyListeners();
  }

  Future<int> _getUserId() async {
    String email = _prefs.getString('email')!;
    String sub = email.substring(7, 8);
    return int.parse(sub);
  }

  Future<void> getUsers() async {
    _users = await _userRepository.getUsers();
    notifyListeners();
  }

  Future<void> getUserData(int id) async {
    _data = await _userRepository.getUserData(id);
    notifyListeners();
  }
}
