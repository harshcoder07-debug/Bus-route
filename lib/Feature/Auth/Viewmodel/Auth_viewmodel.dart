import 'package:busapp/Data/Repository/repository.dart';
import 'package:flutter/foundation.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthRepository repository;

  AuthViewmodel(this.repository);

  // bool isLoading = false;
  // String? error;
  // loading state logic

  Authstate _state = Authstate();
  Authstate get state => _state;

  void _setstate(Authstate newstate) {
    _state = newstate;
    notifyListeners();
  }

  // login logic
  Future<bool> login(String email, String password) async {
    _setstate(Authstate(isloading: true));
    notifyListeners();

    try {
      await repository.login(email, password);
      _setstate(Authstate(isloading: false));
      return true;
    } catch (e) {
      _setstate(Authstate(isloading: false, error: e.toString()));
      return false;
    } finally {
      _setstate(Authstate(isloading: false));
      notifyListeners();
    }
  }

  //signup logic
  Future<bool> signup(String email, String password) async {
    _setstate(Authstate(isloading: true));
    notifyListeners();

    try {
      await repository.signup(email, password);
      _setstate(Authstate(isloading: true));
      return true;
    } catch (e) {
      _setstate(Authstate(isloading: false, error: e.toString()));
      return false;
    } finally {
      _setstate(Authstate(isloading: false));
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await repository.logout();
  }
}

class Authstate {
   final bool isloading;
  final String? error;
   Authstate({ this.isloading =false, this.error});
  Authstate copyWith({bool? isLoading, String? error}) {
    return Authstate(isloading: isLoading ?? isloading, error: error);
  }
}
