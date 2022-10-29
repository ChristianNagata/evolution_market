import 'package:dartz/dartz.dart';
import 'package:evolution_market/core/failures.dart';
import 'package:evolution_market/layers/domain/entities/auth_entity.dart';
import 'package:evolution_market/layers/domain/repositories/auth_repository.dart';
import 'package:evolution_market/layers/presentation/controllers/navigation_bar_notifier.dart';
import 'package:evolution_market/layers/presentation/controllers/product_notifier.dart';
import 'package:evolution_market/layers/presentation/ui/screens/home.dart';
import 'package:evolution_market/layers/presentation/ui/screens/login.dart';
import 'package:evolution_market/layers/presentation/ui/widgets/credential_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error_object.dart';

enum AuthState { initial, loading, loaded, error }

class AuthNotifier with ChangeNotifier {
  final AuthRepository _authRepository;
  final NavigationBarNotifier _navigationBar;
  final ProductNotifier _productNotifier;
  late GlobalKey<ScaffoldState> key;

  late SharedPreferences _prefs;
  late bool _isAuthenticated;

  String _token = '';
  Option<ErrorObject> _failure = none();
  AuthState _state = AuthState.initial;

  AuthNotifier(
      this._authRepository, this._navigationBar, this._productNotifier);

  Option<ErrorObject> get failure => _failure;

  AuthState get state => _state;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> init() async {
    key = GlobalKey();
    _prefs = await SharedPreferences.getInstance();
    await _readData();
    _isAuthenticated = _token != '' || !_productNotifier.tokenExpired;
    notifyListeners();
  }

  Future<void> _readData() async {
    _token = _prefs.getString('token') ?? '';
  }

  Future<void> login(AuthEntity auth) async {
    _state = AuthState.loading;
    _failure = none();

    final loginEither = await _authRepository.login(auth);
    loginEither.fold(_loginL, (token) => _loginR(token, auth));

    _productNotifier.init();

    notifyListeners();
  }

  void _loginL(FailureEntity failure) {
    _state = AuthState.error;
    _failure = optionOf(
      ErrorObject.mapFailureToErrorObject(failure: failure),
    );
    String? message = _failure.fold(
      () => null,
      (a) => a.message,
    );
    showCredentialErrorDialog(key.currentState!.context, message!);
  }

  Future<void> _loginR(String token, AuthEntity auth) async {
    _state = AuthState.loaded;
    await _prefs.setString('token', token);
    await _prefs.setString('email', auth.email);
    _isAuthenticated = true;
    Navigator.pushAndRemoveUntil(
      key.currentState!.context,
      MaterialPageRoute(builder: (_) => const Home()),
      (route) => false,
    );
  }

  Future<void> logout(BuildContext context) async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const Login()),
      (route) => false,
    );
    _prefs.setString('token', '');
    _prefs.setString('email', '');
    _productNotifier.setState(ProductsState.initial);
    _navigationBar.reset();
    _isAuthenticated = false;

    notifyListeners();
  }
}
