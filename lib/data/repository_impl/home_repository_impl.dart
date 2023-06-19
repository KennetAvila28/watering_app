import 'package:watering_system/data/data_source/remote/home_services.dart';
import 'package:watering_system/domain/repositories/home_screen_repository.dart';
import 'package:injectable/injectable.dart';

///Will be responsible to implement the home repository and having the functionality here

@Injectable(as: HomeScreenRepository)
class HomeScreenRepositoryImpl extends HomeScreenRepository {
  final HomeServices services;

  HomeScreenRepositoryImpl(this.services);
}
