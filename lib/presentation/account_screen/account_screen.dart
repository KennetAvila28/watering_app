import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watering_system/infrastructure/di/inject_config.dart';
import 'package:watering_system/presentation/utils/utils.dart';
import 'package:watering_system/presentation/widgets/widgets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final user = getIt.get<FirebaseAuth>().currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30, left: 5, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 70,
                    child: Image.network(user?.photoURL ??
                        'https://upload.wikimedia.org/wikipedia/commons/e/e0/Userimage.png'),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Fonts.normalMediumText(
                        user?.displayName ?? user?.email ?? 'Usuario',
                        color: Colors.black)),
                Form(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: CustomInputField(
                      onChanged: (text) {},
                      label: "Nombre",
                      prefixIcon: const Icon(Icons.manage_accounts),
                      inputType: TextInputType.text,
                      validator: (value) {
                        if (value == null) {
                          return "El nombre no puede estar vacio";
                        }
                        return null;
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
