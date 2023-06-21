import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watering_system/domain/usecase/auth_usecase.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_cubit.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_state.dart';
import 'package:watering_system/infrastructure/di/inject_config.dart';
import 'package:watering_system/infrastructure/utils/shared_preferences_manager.dart';
import 'package:watering_system/presentation/utils/resources/images.dart';
import 'package:watering_system/presentation/utils/resources/page_controllers.dart';
import 'package:rxdart/rxdart.dart';

enum TabActive { device, reports, profile }

class MainScreenCubit extends BaseCubit {
  final SharedPreferencesManager sharedPreferencesManager;
  final Images images;
  final NumberFormat intl;
  final DevicesPagesController devicePagesController;
  MainScreenCubit(
    this.sharedPreferencesManager,
    this.intl,
    this.images,
    this.devicePagesController,
  ) : super(InitialState());
  int currentTab = 0;
  double appBarHeight = 100;
  TabActive tabAcitve = TabActive.device;
  var behaviorChangeTab = BehaviorSubject<int>();
  Stream<int> get observerChangeTab => behaviorChangeTab.stream;
  AuthUseCase session = getIt.get();

  changeTab(
    int index,
  ) {
    if (currentTab != index) {
      currentTab = index;
      behaviorChangeTab.sink.add(index);
    }
  }

  dologin(BuildContext context) {
    Navigator.pop(context);
  }

  doTermsAndConditions() {}

  doPrivacityNotice() {}
}
