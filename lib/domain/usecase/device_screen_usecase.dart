import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:watering_system/domain/repositories/device_screen_repository.dart';
import 'package:watering_system/infrastructure/architecture/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:watering_system/infrastructure/di/inject_config.dart';

@injectable
class DeviceScreenUseCase extends BaseUseCase<DeviceScreenRepository> {
  DeviceScreenUseCase(DeviceScreenRepository repository) : super(repository);

  CollectionReference get getCollection => repository.getCollection;

  Stream<QuerySnapshot> get userStream => getCollection
      .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
      .collection('devices')
      .snapshots();
}
