import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30, left: 5, right: 5),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Works account")],
            ),
          ),
        ));
  }
}
