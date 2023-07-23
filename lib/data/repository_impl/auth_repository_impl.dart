import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:watering_system/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:watering_system/infrastructure/architecture/data/base_response.dart';
import 'package:watering_system/presentation/utils/error_handler.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._auth);

  final FirebaseAuth _auth;
  
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
    await _auth.signOut();
  }
  
  @override
  Future<BaseResponse<UserCredential, FirebaseErrorResponse>> signInGoogle() async {
    print("Hello");
    try {
      final response = await _auth.signInWithProvider(GoogleAuthProvider());
      return BaseResponse.completed(response);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return BaseResponse.error(FirebaseErrorResponse(message: e.code));
    }
  }
}
