import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:watering_system/presentation/presentation.dart';
import 'package:watering_system/infrastructure/di/app_initializer.dart';
import 'package:watering_system/infrastructure/flavor/flavor_config.dart';

void main() async {
  await AppInitializer.setupPrerequisites(
    Flavor.dev,
  );

  final multiProvider = Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        message: "AquaGarden",
        location: BannerLocation.topStart,
        child: App(),
      ));
  runZonedGuarded(
    () async {
      runApp(multiProvider);
    },
    (error, stack) {
      log("App Error with: $error");

      log("App Error stack: $stack");
    },
  );
}
