import 'package:evolution_market/layers/domain/entities/auth_entity.dart';
import 'package:evolution_market/layers/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthNotifier with ChangeNotifier {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository);

  Future<void> login(AuthEntity auth) async {
    await _authRepository.login(auth);
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }
}
