import 'package:watering_system/domain/repositories/home_screen_repository.dart';
import 'package:watering_system/infrastructure/architecture/base_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenUseCase extends BaseUseCase<HomeScreenRepository> {
  HomeScreenUseCase(HomeScreenRepository repository) : super(repository);
}
