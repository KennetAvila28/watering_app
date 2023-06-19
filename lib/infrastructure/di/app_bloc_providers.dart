import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watering_system/domain/usecase/home_screen_usecase.dart';
import 'package:watering_system/infrastructure/utils/shared_preferences_manager.dart';

import 'package:watering_system/presentation/home_screen/cubit/home_screen_cubit.dart';
import 'package:watering_system/presentation/main_screen/cubit/main_screen_cubit.dart';
import 'package:watering_system/presentation/utils/resources/images.dart';
import 'package:watering_system/presentation/utils/resources/page_controllers.dart';
import 'package:provider/single_child_widget.dart';
import 'inject_config.dart';

final _sharedPreferencesManager = getIt.get<SharedPreferencesManager>();
final _intl = getIt.get<NumberFormat>();
final _images = getIt.get<Images>();

///This will hold every bloc provider that will be used across the app
List<SingleChildWidget> get appProviders => [
      BlocProvider(
          create: (_) => MainScreenCubit(_sharedPreferencesManager, _intl,
              _images, HomePagesController())),
      BlocProvider(
          create: (_) => HomeScreenCubit(getIt.get<HomeScreenUseCase>(),
              _sharedPreferencesManager, _intl, _images)),
    ];
