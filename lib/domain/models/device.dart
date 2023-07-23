import 'dart:convert';

class Device {
  String ip;
  bool isConnected;

  double humidity;
  double temp;
  double humidityA;
  String userId;
  String name;
  bool isActive;

  bool isManual;
  bool celcius;
  bool watering;
  String latest;
  Device({
    required this.ip,
    required this.isConnected,
    required this.humidity,
    required this.temp,
    required this.humidityA,
    required this.userId,
    required this.name,
    required this.latest,
    this.isActive = false,
    this.celcius = true,
    this.isManual = false,
    this.watering = false,
  });

  Device copyWith(
      {String? ip,
      bool? isConnected,
      double? humidity,
      double? temp,
      double? humidityA,
      String? userId,
      String? name,
      String? latest}) {
    return Device(
      ip: ip ?? this.ip,
      isConnected: isConnected ?? this.isConnected,
      humidity: humidity ?? this.humidity,
      temp: temp ?? this.temp,
      humidityA: humidityA ?? this.humidityA,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      latest: latest ?? this.latest,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ip': ip,
      'isConnected': isConnected,
      'humidity': humidity,
      'temp': temp,
      'ambHumidity': humidityA,
      'userId': userId,
      'name': name,
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
        ip: map['ip'] ?? '',
        isConnected: map['isConnected'] ?? false,
        humidity: map['humidity'] ?? 0,
        temp: map['temp'] ?? 0,
        humidityA: map['humidityA'] ?? 0,
        userId: map['userId'] ?? '',
        name: map['name'] ?? '',
        isActive: map['isActive'] ??  false,
        isManual: map['isManual'] ??  false,
        watering: map['watering'] ??  false,
        celcius: map['celcius']??false  ,
        latest: map['latest']?? '');
  }

  String toJson() => json.encode(toMap());

  factory Device.fromJson(String source) => Device.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Device(ip: $ip, isConnected: $isConnected, humidity: $humidity, temp: $temp, ambHumidity: $humidityA, userId: $userId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Device &&
        other.ip == ip &&
        other.isConnected == isConnected &&
        other.humidity == humidity &&
        other.temp == temp &&
        other.humidityA == humidityA &&
        other.userId == userId &&
        other.name == name;
  }

  @override
  int get hashCode {
    return ip.hashCode ^
        isConnected.hashCode ^
        humidity.hashCode ^
        temp.hashCode ^
        humidityA.hashCode ^
        userId.hashCode ^
        name.hashCode;
  }
}
