import 'package:busapp/Core/Services/Auth_service.dart';

class Authrepository {
  final AuthService _authService;

  Authrepository(this._authService);
  Future<void> Login(String email, String password) async {
    await _authService.Login(email, password);
  }

  Future<void> Logout() async {
    await _authService.Logout();
  }
}
