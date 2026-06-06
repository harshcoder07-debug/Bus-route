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
      rethrow;
    } finally {
      setloading(false);
    }
  }
}
