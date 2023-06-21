import 'package:watering_system/domain/repositories/device_screen_repository.dart';
import 'package:watering_system/infrastructure/architecture/base_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeviceScreenUseCase extends BaseUseCase<DeviceScreenRepository> {
  DeviceScreenUseCase(DeviceScreenRepository repository) : super(repository);
}
