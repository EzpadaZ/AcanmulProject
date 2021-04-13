class AuthService {
  static final AuthService _authService = AuthService._internal();
  final debugMode = true;

  factory AuthService() {
    return _authService;
  }

  AuthService._internal();

  // Singleton para uso en todas las visas (o almenos las que requieren auth, como la primera.)

  bool isLoggedIn() {
    if (debugMode) {
      return false;
    } else {
      // Login process.
    }
  }
}
