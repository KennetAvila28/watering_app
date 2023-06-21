import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:watering_system/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:watering_system/infrastructure/architecture/data/base_response.dart';
import 'package:watering_system/presentation/utils/error_handler.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._auth) {
    init();
  }

  final FirebaseAuth _auth;
  User? _user;

  final Completer<void> _completer = Completer();
  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }

  void init() async {
    _auth.authStateChanges().listen((User? user) {
      if (!_completer.isCompleted) {
        _completer.complete();
      }
      _user = user;
    });
  }

  @override
  Future<BaseResponse<bool, FirebaseErrorResponse>> sendResetPasswordLink(
      String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return BaseResponse.completed(true);
    } on FirebaseAuthException catch (e) {
      return BaseResponse.error(FirebaseErrorResponse(message: e.code));
    }
  }

  @override
  Future<BaseResponse<UserCredential, FirebaseErrorResponse>>
      signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return BaseResponse.completed(response);
    } on FirebaseAuthException catch (e) {
      return BaseResponse.error(FirebaseErrorResponse(message: e.code));
    }
  }

  @override
  Future<void> signOut() async {
    print("Hello");
    await _auth.signOut();
  }
}
