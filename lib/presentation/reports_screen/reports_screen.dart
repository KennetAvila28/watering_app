import 'package:flutter/material.dart';
import 'package:watering_system/presentation/utils/utils.dart';

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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Fonts.normalMediumText(
                      "Reportes no disponibles por el momento")
                ],
              ),
            ),
          ),
        ));
  }
}
