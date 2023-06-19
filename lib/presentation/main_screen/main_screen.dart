import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_state.dart';
import 'package:watering_system/presentation/main_screen/cubit/main_screen_cubit.dart';
import 'package:watering_system/presentation/widgets/custom_app_bar.dart';
import 'package:watering_system/presentation/widgets/widgets.dart';
import 'package:watering_system/presentation/presentation.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainScreenCubit>();
    final pages = [
      PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: cubit.homePagesController.controller,
        children: const [HomeScreen()],
      ),
    ];
    return BlocBuilder<MainScreenCubit, BaseState>(
      bloc: cubit,
      builder: (buildContext, state) => SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomAppBar(
                assetTitle: cubit.images.appIconPNG,
                actions: [],
                // bottom: Container(),
              )),
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          body: StreamBuilder(
            stream: cubit.observerChangeTab,
            initialData: 0,
            builder: (context, snapShot) => IndexedStack(
              index: snapShot.data,
              children: pages,
            ),
          ),
          bottomNavigationBar: CustomBottomBar(
              items: [
                BottomItem("Devices", cubit.images.devices, false),
                BottomItem("Reports", cubit.images.reports, false),
                BottomItem("Account", cubit.images.account, false),
              ],
              onItemPressed: (value) async {
                TabActive tabActive = TabActive.values.elementAt(value);
                cubit.homePagesController.resetStack();
                switch (tabActive) {
                  case TabActive.home:
                    cubit.changeTab(tabActive.index);
                    break;
                  default:
                }
              }),
        ),
      ),
    );
  }
}
