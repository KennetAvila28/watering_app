import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_state.dart';
import 'package:watering_system/presentation/home_screen/cubit/home_screen_cubit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<HomeScreenCubit>();

    return BlocBuilder<HomeScreenCubit, BaseState>(
      builder: (buildContext, state) {
        return SafeArea(
          top: false,
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 30, left: 5, right: 5),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
          ),
        );
      },
    );
  }
}
