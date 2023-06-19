import 'dart:convert';

class Device {
  String ip;
  bool isConnected;
  int humidity;
  int temp;
  int ambHumidity;
  String userId;
  String name;
  Device({
    required this.ip,
    required this.isConnected,
    required this.humidity,
    required this.temp,
    required this.ambHumidity,
    required this.userId,
    required this.name,
  });

  Device copyWith({
    String? ip,
    bool? isConnected,
    int? humidity,
    int? temp,
    int? ambHumidity,
    String? userId,
    String? name,
  }) {
    return Device(
      ip: ip ?? this.ip,
      isConnected: isConnected ?? this.isConnected,
      humidity: humidity ?? this.humidity,
      temp: temp ?? this.temp,
      ambHumidity: ambHumidity ?? this.ambHumidity,
      userId: userId ?? this.userId,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ip': ip,
      'isConnected': isConnected,
      'humidity': humidity,
      'temp': temp,
      'ambHumidity': ambHumidity,
      'userId': userId,
      'name': name,
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      ip: map['ip'] ?? '',
      isConnected: map['isConnected'] ?? false,
      humidity: map['humidity']?.toInt() ?? 0,
      temp: map['temp']?.toInt() ?? 0,
      ambHumidity: map['ambHumidity']?.toInt() ?? 0,
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Device.fromJson(String source) => Device.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Device(ip: $ip, isConnected: $isConnected, humidity: $humidity, temp: $temp, ambHumidity: $ambHumidity, userId: $userId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Device &&
        other.ip == ip &&
        other.isConnected == isConnected &&
        other.humidity == humidity &&
        other.temp == temp &&
        other.ambHumidity == ambHumidity &&
        other.userId == userId &&
        other.name == name;
  }

  @override
  int get hashCode {
    return ip.hashCode ^
        isConnected.hashCode ^
        humidity.hashCode ^
        temp.hashCode ^
        ambHumidity.hashCode ^
        userId.hashCode ^
        name.hashCode;
  }
}
