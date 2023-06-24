import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:watering_system/domain/repositories/device_screen_repository.dart';
import 'package:injectable/injectable.dart';

///Will be responsible to implement the Device repository and having the functionality here

@Injectable(as: DeviceScreenRepository)
class DeviceScreenRepositoryImpl extends DeviceScreenRepository {
  DeviceScreenRepositoryImpl(this._db);
  final FirebaseFirestore _db;
  @override
  CollectionReference get getCollection => _db.collection("users");

  @override
  Future<void> write(String id, data) async {
    return;
  }
}
