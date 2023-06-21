import 'package:flutter/material.dart';
import 'package:watering_system/presentation/utils/utils.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({required Key key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: super.key,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            children: [
              Row(
                children: [
                  Fonts.boldText(
                    "Recupera tu contraseña",
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Fonts.normalMediumText(
                        "Correo electrónico",
                        size: 14,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    color: AppColors.greenAccent,
                    borderRadius: BorderRadius.circular(30)),
                child: InkWell(
                  onTap: () {
                    onTap();
                  },
                  child: Center(
                    child: Fonts.normalMediumText(
                      'Recuperar',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
