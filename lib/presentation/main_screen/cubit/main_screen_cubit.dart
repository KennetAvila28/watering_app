import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_cubit.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_state.dart';
import 'package:watering_system/infrastructure/utils/shared_preferences_manager.dart';
import 'package:watering_system/presentation/utils/resources/images.dart';
import 'package:watering_system/presentation/utils/resources/page_controllers.dart';
import 'package:rxdart/rxdart.dart';

enum TabActive { home, products, promos, favorites, profile }

class MainScreenCubit extends BaseCubit {
  final SharedPreferencesManager sharedPreferencesManager;
  final Images images;
  final NumberFormat intl;
  final HomePagesController homePagesController;
  MainScreenCubit(
    this.sharedPreferencesManager,
    this.intl,
    this.images,
    this.homePagesController,
  ) : super(InitialState());
  int currentTab = 0;
  double appBarHeight = 100;
  TabActive tabAcitve = TabActive.home;
  var behaviorChangeTab = BehaviorSubject<int>();
  Stream<int> get observerChangeTab => behaviorChangeTab.stream;

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
