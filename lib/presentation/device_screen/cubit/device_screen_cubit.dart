import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watering_system/domain/models/device.dart';
import 'package:watering_system/domain/usecase/device_screen_usecase.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_cubit.dart';
import 'package:watering_system/infrastructure/architecture/bloc/base_state.dart';
import 'package:watering_system/infrastructure/utils/shared_preferences_manager.dart';
import 'package:watering_system/presentation/device_screen/internal/device_details.dart';
import 'package:watering_system/presentation/utils/resources/images.dart';

///Device Cubit that will have the repo and all the requests
class DeviceScreenCubit extends BaseCubit {
  final SharedPreferencesManager sharedPreferencesManager;
  final Images images;
  final NumberFormat intl;
  DeviceScreenCubit(
    this.useCase,
    this.sharedPreferencesManager,
    this.intl,
    this.images,
  ) : super(
          InitialState(),
        );

  final DeviceScreenUseCase useCase;

  void details(BuildContext context, Device device) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DeviceDetails(
                  device: device,
                )));
  }
  // Future<void> setShopping(bool value) async {
  //   emit(LoadingState());
  //   final response = await useCase.setShopping(value);
  //   if (response.success) {
  //     emit(SuccessState<bool>(response.data!));
  //   } else {
  //     emit(FailureState(response.error));
  //   }
  // }
}
