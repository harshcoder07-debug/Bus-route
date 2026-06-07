// ignore_for_file: prefer_final_fields

import 'package:busapp/Data/Repository/Authrepository.dart';
import 'package:flutter/material.dart';

class Authviewmodel extends ChangeNotifier {
  final Authrepository repo;
  bool _isloading = false;

  Authviewmodel(this.repo);
  bool get loading => _isloading;

  //seting loading
  void setloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      setloading(true);
      await repo.Login(email, password);
      return true;
    } catch (e) {
      return false;
    } finally {
      setloading(false);
    }
  }

  Future<String?> signup({
    required String email,
    required String password,
  }) async {
    try {
      if (email.trim().isEmpty || password.trim().isEmpty) {
        return "Email and Password are required";
      }

      if (password.length < 6) {
        return "Password must be at least 6 characters";
      }

      setloading(true);

      await repo.Signup(email, password);

      return null; // Success
    } catch (e) {
      return e.toString();
    } finally {
      setloading(false);
    }
  }

  Future<void> logout() async {
    await repo.Logout();
  }
}
