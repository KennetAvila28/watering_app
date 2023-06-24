import 'package:watering_system/domain/models/device.dart';

List<Device> deviceList = [
  Device(
      ip: "192.168.0.1",
      ambHumidity: 92,
      humidity: 86,
      isConnected: false,
      name: 'Jardin',
      temp: 66,
      userId: 'Kennet'),
  Device(
      ip: "192.168.0.2",
      ambHumidity: 92,
      humidity: 86,
      isConnected: true,
      name: 'Jardin',
      temp: 66,
      userId: 'Kennet')
];
