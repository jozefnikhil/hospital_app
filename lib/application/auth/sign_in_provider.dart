import 'dart:developer';

import 'package:amrita_treatment/domain/auth/signin/signin.dart';
import 'package:amrita_treatment/infrastructure/auth/sign_in_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInProvider with ChangeNotifier {
  final SignInRepo _repo = SignInRepo();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  bool _isLoading = false;
  Signin? _user;
  String? _error;

  bool get isLoading => _isLoading;
  Signin? get user => _user;
  String? get error => _error;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final response = await _repo.signin(
        username: username,
        password: password,
      );
      if (response != null) {
        _user = response;
        log('its not null');
        await _secureStorage.write(key: "token", value: response.token);

        await _secureStorage.write(
          key: "user_id",
          value: response.userDetails?.id.toString(),
        );
        await _secureStorage.write(
          key: "username",
          value: response.userDetails?.username,
        );
      } else {
        _error = "Invalid credentials";
      }
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
