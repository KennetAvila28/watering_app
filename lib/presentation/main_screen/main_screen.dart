import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_state.dart';
import 'package:watering_system/infrastructure/di/di.dart';
import 'package:watering_system/presentation/account_screen/account_screen.dart';
import 'package:watering_system/presentation/auth_screen/auth_screen.dart';
import 'package:watering_system/presentation/device_screen/device_screen.dart';
import 'package:watering_system/presentation/main_screen/cubit/main_screen_cubit.dart';
import 'package:watering_system/presentation/reports_screen/reports_screen.dart';
import 'package:watering_system/presentation/widgets/widgets.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<User?> user;
  User? session;

  @override
  void initState() {
    super.initState();
    user = getIt.get<FirebaseAuth>().authStateChanges().listen((user) {
      if (user == null) {
        session = null;
        setState(() {});
      } else {
        session = user;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    user.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainScreenCubit>();
    final pages = [
      PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: cubit.devicePagesController.controller,
        children: const [DeviceScreen(), ReportsScreen(), AccountScreen()],
      ),
      PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: cubit.devicePagesController.controller,
        children: const [ReportsScreen()],
      ),
      PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: cubit.devicePagesController.controller,
        children: const [AccountScreen()],
      ),
    ];
    return BlocBuilder<MainScreenCubit, BaseState>(
      bloc: cubit,
      builder: (buildContext, state) => SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: session == null
              ? null
              : PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: CustomAppBar(
                    assetTitle: cubit.images.appIconPNG,
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.logout),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                        },
                      )
                    ],
                    // bottom: Container(),
                  ),
                ),
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          body: session == null
              ? const AuthScreen()
              : StreamBuilder(
                  stream: cubit.observerChangeTab,
                  initialData: 0,
                  builder: (context, snapShot) => IndexedStack(
                    index: snapShot.data,
                    children: pages,
                  ),
                ),
          bottomNavigationBar: session == null
              ? null
              : CustomBottomBar(
                  items: [
                    BottomItem("Devices", cubit.images.devices, false),
                    BottomItem("Reports", cubit.images.reports, false),
                    BottomItem("Account", cubit.images.account, false),
                  ],
                  onItemPressed: (value) async {
                    TabActive tabActive = TabActive.values.elementAt(value);
                    switch (tabActive) {
                      case TabActive.device:
                        cubit.changeTab(tabActive.index);
                        break;
                      case TabActive.reports:
                        cubit.changeTab(tabActive.index);
                        cubit.devicePagesController.showReportsScreen();
                        break;
                      case TabActive.profile:
                        cubit.changeTab(tabActive.index);
                        cubit.devicePagesController.showProfileScreen();
                        break;
                      default:
                    }
                  },
                ),
        ),
      ),
    );
  }
}
