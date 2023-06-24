import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:watering_system/infrastructure/architecture/base_repository.dart';

abstract class DeviceScreenRepository extends BaseRepository {
  CollectionReference get getCollection;

  Future<void> write(String id, data);
}
