import 'package:dartz/dartz.dart';
import 'package:evolution_market/layers/domain/entities/auth_entity.dart';
import 'package:evolution_market/layers/domain/repositories/auth_repository.dart';
import 'package:evolution_market/layers/presentation/ui/screens/home.dart';
import 'package:evolution_market/layers/presentation/ui/widgets/credential_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error_object.dart';
import '../ui/screens/login.dart';

enum AuthState { initial, loading, loaded, error }

class AuthNotifier with ChangeNotifier {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  late SharedPreferences _prefs;
  late bool _isAuthenticated;

  final AuthRepository _authRepository;
  Option<ErrorObject> _failure = none();
  AuthState _state = AuthState.initial;

  AuthNotifier(this._authRepository) {
    _initConfig();
  }

  Option<ErrorObject> get failure => _failure;

  AuthState get state => _state;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> _initConfig() async {
    _prefs = await SharedPreferences.getInstance();
    _isAuthenticated = _prefs.get('token') != '';
    notifyListeners();
  }

  Future<void> login(AuthEntity auth) async {
    _state = AuthState.loading;
    _failure = none();

    final loginEither = await _authRepository.login(auth);
    loginEither.fold(
      (l) {
        _state = AuthState.error;
        _failure = optionOf(
          ErrorObject.mapFailureToErrorObject(failure: l),
        );
        String? message = _failure.fold(
          () => null,
          (a) => a.message,
        );
        showCredentialErrorDialog(key.currentState!.context, message!);
      },
      (token) async {
        _state = AuthState.loaded;
        await _prefs.setString('token', token);
        _isAuthenticated = true;
      },
    );

    notifyListeners();
  }

  Future<void> logout() async {
    await _prefs.setString('token', '');
    _isAuthenticated = false;
    notifyListeners();
  }
}
