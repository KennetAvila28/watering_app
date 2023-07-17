import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watering_system/domain/models/device.dart';
import 'package:watering_system/infrastructure/di/di.dart';
import 'package:watering_system/presentation/utils/utils.dart';

class DeviceDetails extends StatelessWidget {
  const DeviceDetails({super.key, required this.device});
  final Device device;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(getIt.get<Images>().devices),
          const Text(
            'DeviceDetails is working',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
