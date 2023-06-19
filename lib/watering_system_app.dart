import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watering_system/infrastructure/di/di.dart';
import 'package:watering_system/infrastructure/routing/routing.dart';

class WateringSystemApp extends StatelessWidget {
  WateringSystemApp({Key? key}) : super(key: key);

  final _rootRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _rootRouter.config(),
      title: 'AguaGarden',
      theme: ThemeData(fontFamily: 'Monserrat'),
      builder: (_, router) => MultiBlocProvider(
        providers: appProviders,
        child: router!,
      ),
    );
  }
}
