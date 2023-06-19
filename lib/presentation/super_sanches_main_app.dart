import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watering_system/infrastructure/di/app_bloc_providers.dart';
import 'package:watering_system/infrastructure/routing/app_router.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _rootRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _rootRouter.config(),
      title: 'AquaGarden',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: const MaterialColor(0xFF53B21C, {
          100: Color(0xFF53B21C),
          50: Color(0xFF53B21C),
          200: Color(0xFF53B21C),
          300: Color(0xFF53B21C),
          400: Color(0xFF53B21C),
          500: Color(0xFF53B21C),
          600: Color(0xFF53B21C),
          700: Color(0xFF53B21C)
        }),
      ),
      builder: (_, router) {
        return MultiBlocProvider(providers: appProviders, child: router!);
      },
    );
  }
}
