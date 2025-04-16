import '../Model/AuthUser.dart';

class AuthResult {
  final AuthUser? user;
  final String? error;
  final bool success;

  AuthResult({
    this.user,
    this.error,
    required this.success,
  });
}