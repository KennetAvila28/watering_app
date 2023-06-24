import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watering_system/domain/usecase/auth_usecase.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_cubit.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_state.dart';
import 'package:watering_system/infrastructure/utils/utils.dart';
import 'package:watering_system/presentation/utils/error_handler.dart';
import 'package:watering_system/presentation/utils/resources/resources.dart';

class AuthScreenCubit extends BaseCubit {
  final SharedPreferencesManager sharedPreferencesManager;
  final Images images;
  final NumberFormat intl;
  final AuthUseCase useCase;
  AuthScreenCubit(
      this.sharedPreferencesManager, this.images, this.intl, this.useCase)
      : super(InitialState());
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String forgotPass = '';

  void onChangePass(String input) {
    password = input;
  }

  void onChangeEmail(String input) {
    email = input;
  }

  void onChangeForgotPass(String input) {
    forgotPass = input;
  }

  void onSend() async {
    emit(LoadingState());
    if (email.isEmpty && password.isEmpty) {
      emit(FailureState(FirebaseErrorResponse(message: "required-fields")));
      return;
    }
    final response = await useCase.signInWithEmailAndPassword(email, password);
    if (!response.success) {
      emit(FailureState(response.error));
      return;
    }
    emit(SuccessState(response.data));
  }
}
