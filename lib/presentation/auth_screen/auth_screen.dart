import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_state.dart';
import 'package:watering_system/infrastructure/utils/show_modal.dart';
import 'package:watering_system/presentation/auth_screen/cubit/auth_screen_cubit.dart';
import 'package:watering_system/presentation/auth_screen/internal/forgot_password.dart';
import 'package:watering_system/presentation/utils/utils.dart';
import 'package:watering_system/presentation/widgets/widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthScreenCubit>();
    void onForgotPassword(BuildContext context) {
      final formKey = GlobalKey<FormState>();
      showModal(context, ForgotPassword(key: formKey, onTap: () {}));
    }

    return BlocListener<AuthScreenCubit, BaseState>(
      bloc: cubit,
      listener: (context, state) async {
        if (state is LoadingState) {
          showDialog(
              context: context,
              builder: (_) => LoadingAnimationWidget.newtonCradle(
                  color: AppColors.green, size: 200));
        }
        if (state is FailureState<FirebaseErrorResponse>) {
          Navigator.of(context).pop();
          ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              title: state.error!.errorMessage(),
              type: ArtSweetAlertType.danger,
            ),
          );
        }

        if (state is SuccessState) {
          Navigator.of(context).pop();
          ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              title: "Bienvenido",
              type: ArtSweetAlertType.success,
            ),
          );
        }
      },
      child: BlocBuilder<AuthScreenCubit, BaseState>(
        bloc: cubit,
        builder: (context, state) {
          return Container(
            // color: AppColors.appIconBlue,
            child: Form(
              key: cubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          cubit.images.appTextIcon,
                          width: 150,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: CustomInputField(
                      onChanged: cubit.onChangeEmail,
                      label: "Email",
                      prefixIcon: const Icon(Icons.email),
                      inputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!isValidEmail(value!)) {
                          return "Ingrese un correo valido";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: CustomInputField(
                      onChanged: cubit.onChangePass,
                      label: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      inputType: TextInputType.visiblePassword,
                      isPassword: true,
                      validator: (String? value) {
                        if (!isValidPassword(value)) {
                          return "La contraseña debe tener 8 caracteres, al menos un numero y una letra";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: InkWell(
                      onTap: () {
                        cubit.onSend();
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            color: AppColors.greenAccent,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Fonts.normalMediumText(
                            'Iniciar sesión'.toUpperCase(),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextButton(
                        onPressed: () {
                          onForgotPassword(context);
                        },
                        child:
                            Fonts.normalMediumText("Olvidaste tu contraseña?")),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
