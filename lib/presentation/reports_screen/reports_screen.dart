import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
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
              children: [Text("Works reports")],
            ),
          ),
        ));
  }
}
