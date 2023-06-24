import 'package:firebase_auth/firebase_auth.dart';
import 'package:watering_system/infrastructure/architecture/base_repository.dart';
import 'package:watering_system/infrastructure/architecture/data/base_response.dart';
import 'package:watering_system/presentation/utils/error_handler.dart';

abstract class AuthRepository extends BaseRepository {
  Future<BaseResponse<UserCredential, FirebaseErrorResponse>>
      signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<void> signOut();

  Future<BaseResponse<bool, FirebaseErrorResponse>> sendResetPasswordLink(
      String email);
}
