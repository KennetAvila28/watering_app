import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:watering_system/domain/repositories/auth_repository.dart';
import 'package:watering_system/infrastructure/architecture/data/base_response.dart';
import 'package:watering_system/presentation/utils/utils.dart';

import '../../infrastructure/architecture/base_usecase.dart';

@injectable
class AuthUseCase extends BaseUseCase<AuthRepository> {
  AuthUseCase(AuthRepository repository) : super(repository);

  Future<BaseResponse<bool, FirebaseErrorResponse>> sendResetPasswordLink(
      String email) async {
    return repository.sendResetPasswordLink(email);
  }

  Future<BaseResponse<UserCredential, FirebaseErrorResponse>>
      signInWithEmailAndPassword(String email, String password) async {
    return repository.signInWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    return repository.signOut();
  }

  Future<User?> user() async {
    return repository.user;
  }
}
